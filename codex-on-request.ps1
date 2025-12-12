param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Args
)

# Wrapper to run Codex with the usual sandbox/approval flags, forwarding any extra args.
$command = @("codex", "-s", "workspace-write", "-a", "on-request") + $Args
& $command

# Preserve the exit code from Codex for callers.
if ($LASTEXITCODE -ne $null) {
    exit $LASTEXITCODE
}
