"use client"

import { useState } from "react"
import {
  CalendarIcon,
  ChevronLeft,
  ChevronRight,
  Code,
  CreditCard,
  Download,
  Eye,
  EyeOff,
  LayoutDashboard,
  Phone,
  Settings,
  Smartphone,
  Upload,
  X,
} from "lucide-react"

import { Button } from "@/components/ui/button"
import { Card, CardContent, CardDescription, CardFooter, CardHeader, CardTitle } from "@/components/ui/card"
import { Progress } from "@/components/ui/progress"
import { Switch } from "@/components/ui/switch"
import { Tabs, TabsContent, TabsList, TabsTrigger } from "@/components/ui/tabs"

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

export default function SubscriptionView() {
  // State
  const [isSidebarOpen, setIsSidebarOpen] = useState(false)
  const [showApiPayload, setShowApiPayload] = useState(false)
  const [widgets, setWidgets] = useState<WidgetConfig[]>([
    {
      key: "numberPorting",
      title: "Number Porting",
      description: "Widget for completing number transfer process",
      enabled: true,
    },
    {
      key: "esimManagement",
      title: "eSIM Management",
      description: "Tools for managing and replacing eSIMs",
      enabled: true,
    },
    {
      key: "subscriptionSettings",
      title: "Subscription Settings",
      description: "Configure subscription plan options",
      enabled: true,
    },
    {
      key: "billingInformation",
      title: "Billing Information",
      description: "Payment methods and invoice history",
      enabled: true,
    },
    {
      key: "usageAnalytics",
      title: "Usage Analytics",
      description: "Data, calls, and messages usage tracking",
      enabled: true,
    },
    {
      key: "planAddOns",
      title: "Plan Add-Ons",
      description: "Optional add-ons for subscription plans",
      enabled: true,
    },
  ])

  // Functions
  const toggleWidget = (key: WidgetKey) => {
    setWidgets(widgets.map((widget) => (widget.key === key ? { ...widget, enabled: !widget.enabled } : widget)))
  }

  const toggleAllWidgets = (enabled: boolean) => {
    setWidgets(widgets.map((widget) => ({ ...widget, enabled })))
  }

  const isWidgetEnabled = (key: WidgetKey) => {
    return widgets.find((widget) => widget.key === key)?.enabled || false
  }

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
    <div className="flex min-h-svh bg-background">
      {/* Main Content - Always Visible */}
      <div className="flex-1 p-4 md:p-6">
        <div className="max-w-7xl mx-auto space-y-6 md:space-y-8">
          {/* Main Subscription Card */}
          <Card className="border-s-4 border-s-primary">
            <CardHeader className="flex flex-col md:flex-row md:items-center md:justify-between gap-2 md:gap-4">
              <div>
                <CardTitle className="text-xl md:text-2xl">Premium Mobile Plan</CardTitle>
                <CardDescription className="flex items-center mt-1">
                  <Phone className="size-3 md:size-4 me-1" />
                  +1 (555) 123-4567
                </CardDescription>
              </div>
              <div className="flex flex-col items-start md:items-end mt-2 md:mt-0">
                <span className="text-xl md:text-2xl font-bold">$49.99/month</span>
                <span className="text-xs md:text-sm text-muted-foreground">Next billing: May 15, 2025</span>
              </div>
            </CardHeader>
            <CardContent>
              <div className="grid grid-cols-1 gap-4 md:grid-cols-3 md:gap-6">
                <div>
                  <h3 className="text-sm font-medium mb-1 md:mb-2">Plan Status</h3>
                  <div className="flex items-center">
                    <span className="inline-flex size-2.5 md:size-3 rounded-full bg-green-500 me-2"></span>
                    <span className="text-sm md:text-base">Active</span>
                  </div>
                </div>
                <div>
                  <h3 className="text-sm font-medium mb-1 md:mb-2">Data Usage</h3>
                  <div className="space-y-1 md:space-y-2">
                    <div className="flex justify-between text-xs md:text-sm">
                      <span>8.2 GB / 15 GB</span>
                      <span>55%</span>
                    </div>
                    <Progress value={55} className="h-1.5 md:h-2" />
                  </div>
                </div>
                <div>
                  <h3 className="text-sm font-medium mb-1 md:mb-2">Billing Cycle</h3>
                  <div className="flex items-center">
                    <CalendarIcon className="size-3 md:size-4 me-1 md:me-2" />
                    <span className="text-sm md:text-base">Apr 15 - May 15, 2025</span>
                  </div>
                </div>
              </div>
            </CardContent>
            <CardFooter className="border-t pt-4 md:pt-6 flex flex-col md:flex-row md:justify-end space-y-2 md:space-y-0 md:space-x-2">
              <Button variant="outline" className="w-full md:w-auto">
                View Details
              </Button>
              <Button className="w-full md:w-auto">Manage Plan</Button>
            </CardFooter>
          </Card>

          {/* Action Widgets */}
          <div className="grid grid-cols-1 gap-4 md:gap-6 md:grid-cols-2 lg:grid-cols-3">
            {/* Number Porting Widget */}
            {isWidgetEnabled("numberPorting") && (
              <Card>
                <CardHeader className="pb-2 md:pb-6">
                  <CardTitle className="flex items-center text-base md:text-lg">
                    <Phone className="size-4 md:size-5 me-1.5 md:me-2" />
                    Number Porting
                  </CardTitle>
                  <CardDescription className="text-xs md:text-sm">Complete your number transfer</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    <div className="space-y-2">
                      <div className="flex justify-between text-sm">
                        <span>Porting Progress</span>
                        <span>75%</span>
                      </div>
                      <Progress value={75} className="h-2" />
                    </div>
                    <div className="text-sm space-y-2">
                      <div className="flex items-start">
                        <div className="size-5 rounded-full bg-primary/20 text-primary flex items-center justify-center text-xs me-2 mt-0.5">
                          ✓
                        </div>
                        <div>Authorization submitted</div>
                      </div>
                      <div className="flex items-start">
                        <div className="size-5 rounded-full bg-primary/20 text-primary flex items-center justify-center text-xs me-2 mt-0.5">
                          ✓
                        </div>
                        <div>Carrier verification complete</div>
                      </div>
                      <div className="flex items-start">
                        <div className="size-5 rounded-full bg-muted text-muted-foreground flex items-center justify-center text-xs me-2 mt-0.5">
                          3
                        </div>
                        <div>Final transfer (scheduled for Apr 20)</div>
                      </div>
                    </div>
                  </div>
                </CardContent>
                <CardFooter className="pt-2 md:pt-4">
                  <Button className="w-full text-sm md:text-base py-1.5 md:py-2">Complete Porting</Button>
                </CardFooter>
              </Card>
            )}

            {/* eSIM Replacement Widget */}
            {isWidgetEnabled("esimManagement") && (
              <Card>
                <CardHeader className="pb-2 md:pb-6">
                  <CardTitle className="flex items-center text-base md:text-lg">
                    <Smartphone className="size-4 md:size-5 me-1.5 md:me-2" />
                    eSIM Management
                  </CardTitle>
                  <CardDescription className="text-xs md:text-sm">Replace or transfer your eSIM</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    <div className="p-3 md:p-4 bg-muted rounded-lg flex items-center">
                      <div className="me-3 md:me-4">
                        <Smartphone className="size-8 md:size-10 text-primary" />
                      </div>
                      <div>
                        <h4 className="font-medium text-sm md:text-base">Active eSIM</h4>
                        <p className="text-xs md:text-sm text-muted-foreground">
                          iPhone 15 Pro • Activated on Mar 10, 2025
                        </p>
                      </div>
                    </div>
                    <div className="text-sm space-y-1">
                      <p>Need a new eSIM for a different device?</p>
                      <p>You can quickly transfer or replace your current eSIM.</p>
                    </div>
                  </div>
                </CardContent>
                <CardFooter className="pt-2 md:pt-4 flex flex-col space-y-2">
                  <Button className="w-full text-sm md:text-base py-1.5 md:py-2">Replace eSIM</Button>
                  <Button variant="outline" className="w-full text-sm md:text-base py-1.5 md:py-2">
                    Transfer to New Device
                  </Button>
                </CardFooter>
              </Card>
            )}

            {/* Subscription Settings Widget */}
            {isWidgetEnabled("subscriptionSettings") && (
              <Card>
                <CardHeader className="pb-2 md:pb-6">
                  <CardTitle className="flex items-center text-base md:text-lg">
                    <Settings className="size-4 md:size-5 me-1.5 md:me-2" />
                    Subscription Settings
                  </CardTitle>
                  <CardDescription className="text-xs md:text-sm">Manage your plan configuration</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    <div className="grid grid-cols-2 gap-1.5 md:gap-2">
                      <div className="p-2 md:p-3 border rounded-lg text-center">
                        <h4 className="font-medium text-xs md:text-sm">Data Plan</h4>
                        <p className="text-xs md:text-sm">15 GB</p>
                      </div>
                      <div className="p-2 md:p-3 border rounded-lg text-center">
                        <h4 className="font-medium text-xs md:text-sm">International</h4>
                        <p className="text-xs md:text-sm">Enabled</p>
                      </div>
                      <div className="p-2 md:p-3 border rounded-lg text-center">
                        <h4 className="font-medium text-xs md:text-sm">Roaming</h4>
                        <p className="text-xs md:text-sm">Disabled</p>
                      </div>
                      <div className="p-2 md:p-3 border rounded-lg text-center">
                        <h4 className="font-medium text-xs md:text-sm">Auto-Renew</h4>
                        <p className="text-xs md:text-sm">Enabled</p>
                      </div>
                    </div>
                  </div>
                </CardContent>
                <CardFooter className="pt-2 md:pt-4">
                  <Button className="w-full text-sm md:text-base py-1.5 md:py-2">Modify Settings</Button>
                </CardFooter>
              </Card>
            )}

            {/* Billing Widget */}
            {isWidgetEnabled("billingInformation") && (
              <Card>
                <CardHeader className="pb-2 md:pb-6">
                  <CardTitle className="flex items-center text-base md:text-lg">
                    <CreditCard className="size-4 md:size-5 me-1.5 md:me-2" />
                    Billing Information
                  </CardTitle>
                  <CardDescription className="text-xs md:text-sm">Manage payment methods and invoices</CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-4">
                    <div className="flex items-center justify-between p-2 md:p-3 border rounded-lg">
                      <div className="flex items-center">
                        <div className="h-6 w-10 md:h-8 md:w-12 bg-muted rounded me-2 md:me-3 flex items-center justify-center">
                          <span className="text-xs font-medium">VISA</span>
                        </div>
                        <div>
                          <p className="font-medium text-xs md:text-sm">Visa ending in 4242</p>
                          <p className="text-xs text-muted-foreground">Expires 09/27</p>
                        </div>
                      </div>
                      <div className="size-4 rounded-full border-2 border-primary flex items-center justify-center">
                        <div className="size-2 rounded-full bg-primary"></div>
                      </div>
                    </div>
                    <div className="text-sm">
                      <p className="font-medium">Recent Invoices</p>
                      <div className="mt-2 space-y-2">
                        <div className="flex justify-between items-center">
                          <span>Apr 15, 2025</span>
                          <span className="font-medium">$49.99</span>
                          <Download className="size-4 text-muted-foreground" />
                        </div>
                        <div className="flex justify-between items-center">
                          <span>Mar 15, 2025</span>
                          <span className="font-medium">$49.99</span>
                          <Download className="size-4 text-muted-foreground" />
                        </div>
                      </div>
                    </div>
                  </div>
                </CardContent>
                <CardFooter className="pt-2 md:pt-4">
                  <Button variant="outline" className="w-full text-sm md:text-base py-1.5 md:py-2">
                    Manage Payment Methods
                  </Button>
                </CardFooter>
              </Card>
            )}

            {/* Usage Data Widget */}
            {isWidgetEnabled("usageAnalytics") && (
              <Card>
                <CardHeader className="pb-2 md:pb-6">
                  <CardTitle className="flex items-center text-base md:text-lg">
                    <Upload className="size-4 md:size-5 me-1.5 md:me-2" />
                    Usage Analytics
                  </CardTitle>
                  <CardDescription className="text-xs md:text-sm">
                    Monitor your data, calls, and messages
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <Tabs defaultValue="data">
                    <TabsList className="grid w-full grid-cols-3 h-9">
                      <TabsTrigger value="data" className="text-xs md:text-sm">
                        Data
                      </TabsTrigger>
                      <TabsTrigger value="calls" className="text-xs md:text-sm">
                        Calls
                      </TabsTrigger>
                      <TabsTrigger value="messages" className="text-xs md:text-sm">
                        Messages
                      </TabsTrigger>
                    </TabsList>
                    <TabsContent value="data" className="space-y-4 pt-4">
                      <div className="space-y-2">
                        <div className="flex justify-between text-sm">
                          <span>Monthly Usage</span>
                          <span>8.2 GB / 15 GB</span>
                        </div>
                        <Progress value={55} className="h-2" />
                      </div>
                      <div className="grid grid-cols-2 gap-2 text-center">
                        <div className="p-2 bg-muted rounded-lg">
                          <p className="text-xs text-muted-foreground">Daily Average</p>
                          <p className="font-medium">267 MB</p>
                        </div>
                        <div className="p-2 bg-muted rounded-lg">
                          <p className="text-xs text-muted-foreground">Projected</p>
                          <p className="font-medium">12.4 GB</p>
                        </div>
                      </div>
                    </TabsContent>
                    <TabsContent value="calls" className="space-y-4 pt-4">
                      <div className="space-y-2">
                        <div className="flex justify-between text-sm">
                          <span>Minutes Used</span>
                          <span>124 / Unlimited</span>
                        </div>
                        <Progress value={25} className="h-2" />
                      </div>
                      <div className="grid grid-cols-2 gap-2 text-center">
                        <div className="p-2 bg-muted rounded-lg">
                          <p className="text-xs text-muted-foreground">Outgoing</p>
                          <p className="font-medium">87 mins</p>
                        </div>
                        <div className="p-2 bg-muted rounded-lg">
                          <p className="text-xs text-muted-foreground">Incoming</p>
                          <p className="font-medium">37 mins</p>
                        </div>
                      </div>
                    </TabsContent>
                    <TabsContent value="messages" className="space-y-4 pt-4">
                      <div className="space-y-2">
                        <div className="flex justify-between text-sm">
                          <span>SMS Used</span>
                          <span>45 / Unlimited</span>
                        </div>
                        <Progress value={15} className="h-2" />
                      </div>
                      <div className="grid grid-cols-2 gap-2 text-center">
                        <div className="p-2 bg-muted rounded-lg">
                          <p className="text-xs text-muted-foreground">Sent</p>
                          <p className="font-medium">28 SMS</p>
                        </div>
                        <div className="p-2 bg-muted rounded-lg">
                          <p className="text-xs text-muted-foreground">Received</p>
                          <p className="font-medium">17 SMS</p>
                        </div>
                      </div>
                    </TabsContent>
                  </Tabs>
                </CardContent>
                <CardFooter className="pt-2 md:pt-4">
                  <Button variant="outline" className="w-full text-sm md:text-base py-1.5 md:py-2">
                    View Detailed Analytics
                  </Button>
                </CardFooter>
              </Card>
            )}

            {/* Add-Ons Widget */}
            {isWidgetEnabled("planAddOns") && (
              <Card>
                <CardHeader className="pb-2 md:pb-6">
                  <CardTitle className="flex items-center text-base md:text-lg">
                    <Settings className="size-4 md:size-5 me-1.5 md:me-2" />
                    Plan Add-Ons
                  </CardTitle>
                  <CardDescription className="text-xs md:text-sm">
                    Customize your subscription with add-ons
                  </CardDescription>
                </CardHeader>
                <CardContent>
                  <div className="space-y-3">
                    <div className="flex items-center justify-between p-2 md:p-3 border rounded-lg">
                      <div>
                        <p className="font-medium text-xs md:text-sm">International Roaming</p>
                        <p className="text-xs text-muted-foreground">Use your plan abroad</p>
                      </div>
                      <Button variant="outline" size="sm" className="text-xs h-8">
                        Add $10/mo
                      </Button>
                    </div>
                    <div className="flex items-center justify-between p-2 md:p-3 border rounded-lg">
                      <div>
                        <p className="font-medium text-xs md:text-sm">Data Boost</p>
                        <p className="text-xs text-muted-foreground">Extra 5GB of high-speed data</p>
                      </div>
                      <Button variant="outline" size="sm" className="text-xs h-8">
                        Add $5/mo
                      </Button>
                    </div>
                    <div className="flex items-center justify-between p-2 md:p-3 border rounded-lg">
                      <div>
                        <p className="font-medium text-xs md:text-sm">Premium Support</p>
                        <p className="text-xs text-muted-foreground">24/7 priority customer service</p>
                      </div>
                      <Button variant="outline" size="sm" className="text-xs h-8">
                        Add $3/mo
                      </Button>
                    </div>
                  </div>
                </CardContent>
                <CardFooter className="pt-2 md:pt-4">
                  <Button className="w-full text-sm md:text-base py-1.5 md:py-2">View All Add-Ons</Button>
                </CardFooter>
              </Card>
            )}
          </div>
        </div>
      </div>

      {/* Sidebar Toggle Button - Fixed Position */}
      <div className="fixed top-4 end-4 z-50">
        <Button
          variant="secondary"
          size="sm"
          onClick={() => setIsSidebarOpen(!isSidebarOpen)}
          className="flex items-center gap-1 shadow-md"
        >
          {isSidebarOpen ? <ChevronRight className="size-4" /> : <ChevronLeft className="size-4" />}
          <span className="text-xs">Widget Controls</span>
        </Button>
      </div>

      {/* Sidebar - Overlay */}
      {isSidebarOpen && <div className="fixed inset-0 z-40 bg-black/20" onClick={() => setIsSidebarOpen(false)} />}

      {/* Sidebar - Content */}
      {isSidebarOpen && (
        <div className="fixed top-0 end-0 z-40 h-full w-[300px] bg-background border-s shadow-xl flex flex-col overflow-hidden">
          <div className="p-4 border-b flex items-center justify-between">
            <div className="flex items-center gap-2">
              <LayoutDashboard className="size-5" />
              <h2 className="font-semibold">Widget Controls</h2>
            </div>
            <Button variant="ghost" size="icon" onClick={() => setIsSidebarOpen(false)} className="size-8">
              <X className="size-4" />
            </Button>
          </div>

          <div className="p-4 border-b">
            <div className="flex items-center justify-between">
              <div className="flex items-center gap-2">
                {widgets.every((w) => w.enabled) ? (
                  <Eye className="size-4" />
                ) : widgets.some((w) => w.enabled) ? (
                  <Eye className="size-4 text-muted-foreground" />
                ) : (
                  <EyeOff className="size-4" />
                )}
                <span className="text-sm font-medium">Show All Widgets</span>
              </div>
              <Switch checked={widgets.every((w) => w.enabled)} onCheckedChange={toggleAllWidgets} />
            </div>
          </div>

          <div className="flex-1 overflow-auto p-2">
            <div className="space-y-3">
              {widgets.map((widget) => (
                <div
                  key={widget.key}
                  className={`p-3 rounded-lg border ${
                    widget.enabled ? "bg-primary/5 border-primary/20" : "bg-muted/50"
                  }`}
                >
                  <div className="flex items-center justify-between mb-1">
                    <span className="font-medium text-sm">{widget.title}</span>
                    <Switch checked={widget.enabled} onCheckedChange={() => toggleWidget(widget.key)} />
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
              <Code className="size-4" />
              Show Connect Session
            </Button>
            <div className="text-xs text-muted-foreground">
              <p>This control panel is for demonstration purposes.</p>
              <p>Use it to toggle widgets on/off to showcase different configurations.</p>
            </div>
          </div>
        </div>
      )}

      {/* API Payload Modal */}
      {showApiPayload && (
        <div className="fixed inset-0 bg-black/50 flex items-center justify-center z-50">
          <div className="bg-background rounded-lg shadow-lg w-full max-w-md mx-4">
            <div className="p-4 border-b">
              <h3 className="text-lg font-semibold">Connect Session API Payload</h3>
              <p className="text-sm text-muted-foreground">
                This is the API payload based on your current widget configuration.
              </p>
            </div>
            <div className="p-4">
              <pre className="bg-muted p-4 rounded-md overflow-auto max-h-[300px] text-xs font-mono">
                {formattedPayload}
              </pre>
            </div>
            <div className="p-4 border-t flex justify-end gap-2">
              <Button
                variant="secondary"
                onClick={() => {
                  navigator.clipboard.writeText(formattedPayload)
                }}
              >
                Copy to Clipboard
              </Button>
              <Button onClick={() => setShowApiPayload(false)}>Close</Button>
            </div>
          </div>
        </div>
      )}
    </div>
  )
}
