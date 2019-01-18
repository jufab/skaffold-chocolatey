$ErrorActionPreference = "Stop"
write-host "Attempting to stop any running skaffold processes, to allow upgrade"
try
{
  $running = get-process skaffold
}
catch
{
  write-host "No running skaffold processes to stop"
  $running = @()
}
 
if ($running)
{
  write-host "Stopping skaffold processes"
  foreach($p in $running)
  {
    stop-process $p
    write-verbose "Stopped $($p.ProcessName) $($p.Id)"
  }
}
