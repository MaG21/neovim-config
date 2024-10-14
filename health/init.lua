
local health = vim.health

local function healthcheck()
  health.start("MyConfig Health Check")

  if vim.fn.executable("git") == 1 then
    health.ok("Git is installed")
  else
    health.error("Git is not installed")
  end

  if vim.fn.executable("php") == 1 then
    health.ok("PHP is installed")
  else
    health.error("PHP is not installed")
  end

end

-- Return the health check function
return {
  check = healthcheck
}
