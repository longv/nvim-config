local uv = vim.loop
local pipepath = vim.fn.stdpath("cache") .. "/server.pipe"

-- Attempt to bring up an RPC server no matter what.
-- If the pipe file exists but no one is listening, unlink it first.
local function ensure_pipe(path)
  -- Is a process already listening on that path?
  local ok = pcall(vim.fn.serverstart, path)
  if ok then
    return
  end

  -- Couldn’t start – most likely a stale file.  Remove & retry.
  local stat = uv.fs_stat(path)
  if stat then
    uv.fs_unlink(path) -- remove stale pipe
    pcall(vim.fn.serverstart, path)
  end
end

ensure_pipe(pipepath)
