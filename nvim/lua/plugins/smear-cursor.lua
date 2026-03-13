return {
  "sphamba/smear-cursor.nvim",
  opts = {
    stiffness = 0.8,
    trailing_stiffness = 0.4, --0.4
    trailing_exponent = 0.1,
    distance_stop_animating = 0.5, --0.5
    hide_target_hack = false,
    legacy_computing_symbols_support = true,
    smear_between_buffers = true,
    smear_between_neighbor_lines = true,
    scroll_buffer_space = true,

    smear_insert_mode = true,

    vertical_bar_cursor_insert_mode = true,
    distance_stop_animating_vertical_bar = 0.1,
  },
}
