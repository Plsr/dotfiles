local setup, telescope = pcall(require, "telescope")
if not setup then
  return 
end

telescope.setup({
  exstensions = {
    fzf = {
      fuzzy = true,
      override_generic_sorter = true,
      oferride_file_sorter = true,
      case_mode = "smart_case"
    }
  }
})

telescope.load_extension('fzf')
