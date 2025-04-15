"use client"
import { useState } from "react"
import { ChevronLeft, ChevronRight, Eye, EyeOff, LayoutDashboard, X, Code } from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card } from "@/components/ui/card"
import { Switch } from "@/components/ui/switch"
import { Tooltip, TooltipContent, TooltipProvider, TooltipTrigger } from "@/components/ui/tooltip"
import {
  Dialog,
  DialogContent,
  DialogDescription,
  DialogHeader,
  DialogTitle,
  DialogFooter,
} from "@/components/ui/dialog"

export type WidgetKey =
  | "numberPorting"
  | "esimManagement"
  | "subscriptionSettings"
  | "billingInformation"
  | "usageAnalytics"
  | "planAddOns"

export type WidgetConfig = {
  key: WidgetKey
  title: string
  description: string
  enabled: boolean
}

interface MetaSidebarProps {
  widgets: WidgetConfig[]
  onToggleWidget: (key: WidgetKey) => void
  onToggleAll: (enabled: boolean) => void
  isOpen: boolean
  onToggleSidebar: () => void
}

export function MetaSidebar({ widgets, onToggleWidget, onToggleAll, isOpen, onToggleSidebar }: MetaSidebarProps) {
  const [showApiPayload, setShowApiPayload] = useState(false)
  const allEnabled = widgets.every((widget) => widget.enabled)
  const someEnabled = widgets.some((widget) => widget.enabled)

  // Generate API payload based on enabled widgets
  const generateApiPayload = () => {
    const enabledWidgets = widgets.filter((widget) => widget.enabled).map((widget) => widget.key)

    return {
      subscription: {
        id: "sub_" + Math.random().toString(36).substring(2, 10).toUpperCase(),
        user: "usr_" + Math.random().toString(36).substring(2, 10).toUpperCase(),
        widgets: enabledWidgets,
      },
    }
  }

  const apiPayload = generateApiPayload()
  const formattedPayload = JSON.stringify(apiPayload, null, 2)

  return (
    <>
      <div
        className={`fixed top-0 right-0 h-full z-50 transition-all duration-300 ${isOpen ? "translate-x-0" : "translate-x-full"}`}
      >
        <div className="absolute top-1/2 -left-10 transform -translate-y-1/2">
          <TooltipProvider>
            <Tooltip>
              <TooltipTrigger asChild>
                <Button
                  variant="secondary"
                  size="icon"
                  onClick={onToggleSidebar}
                  className="h-10 w-10 rounded-full shadow-md border"
                >
                  {isOpen ? <ChevronRight className="h-5 w-5" /> : <ChevronLeft className="h-5 w-5" />}
                </Button>
              </TooltipTrigger>
              <TooltipContent side="left">
                <p>{isOpen ? "Hide" : "Show"} Widget Controls</p>
              </TooltipContent>
            </Tooltip>
          </TooltipProvider>
        </div>

        <Card className="h-full w-[300px] rounded-l-lg rounded-r-none border-r-0 flex flex-col shadow-xl">
          <div className="p-4 border-b flex items-center justify-between">
            <div className="flex items-center gap-2">
              <LayoutDashboard className="h-5 w-5" />
              <h2 className="font-semibold">Widget Controls</h2>
            </div>
            <Button variant="ghost" size="icon" onClick={onToggleSidebar} className="h-8 w-8">
              <X className="h-4 w-4" />
            </Button>
          </div>

          <div className="p-4 border-b">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2">
                {allEnabled ? (
                  <Eye className="h-4 w-4" />
                ) : someEnabled ? (
                  <Eye className="h-4 w-4 text-muted-foreground" />
                ) : (
                  <EyeOff className="h-4 w-4" />
                )}
                <span className="text-sm font-medium">Show All Widgets</span>
              </div>
              <Switch checked={allEnabled} onCheckedChange={onToggleAll} />
            </div>
          </div>

          <div className="flex-1 overflow-auto p-2">
            <div className="space-y-3">
              {widgets.map((widget) => (
                <div
                  key={widget.key}
                  className={`p-3 rounded-lg border ${widget.enabled ? "bg-primary/5 border-primary/20" : "bg-muted/50"}`}
                >
                  <div className="flex items-center justify-between mb-1">
                    <span className="font-medium text-sm">{widget.title}</span>
                    <Switch checked={widget.enabled} onCheckedChange={() => onToggleWidget(widget.key)} size="sm" />
                  </div>
                  <p className="text-xs text-muted-foreground">{widget.description}</p>
                </div>
              ))}
            </div>
          </div>

          <div className="p-4 border-t space-y-4">
            <Button
              className="w-full flex items-center justify-center gap-2"
              variant="outline"
              onClick={() => setShowApiPayload(true)}
            >
              <Code className="h-4 w-4" />
              Show Connect Session
            </Button>
            <div className="text-xs text-muted-foreground">
              <p>This control panel is for demonstration purposes.</p>
              <p>Use it to toggle widgets on/off to showcase different configurations.</p>
            </div>
          </div>
        </Card>
      </div>

      <Dialog open={showApiPayload} onOpenChange={setShowApiPayload}>
        <DialogContent className="sm:max-w-md">
          <DialogHeader>
            <DialogTitle>Connect Session API Payload</DialogTitle>
            <DialogDescription>
              This is the API payload that would be sent to the server based on your current widget configuration.
            </DialogDescription>
          </DialogHeader>
          <div className="bg-muted p-4 rounded-md overflow-auto max-h-[400px]">
            <pre className="text-xs font-mono">{formattedPayload}</pre>
          </div>
          <DialogFooter className="sm:justify-start">
            <Button
              type="button"
              variant="secondary"
              onClick={() => {
                navigator.clipboard.writeText(formattedPayload)
              }}
            >
              Copy to Clipboard
            </Button>
            <Button type="button" onClick={() => setShowApiPayload(false)}>
              Close
            </Button>
          </DialogFooter>
        </DialogContent>
      </Dialog>
    </>
  )
}
