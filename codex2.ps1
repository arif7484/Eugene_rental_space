param(
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]]$Args
)

# Wrapper to run Codex with workspace-write sandbox and on-request approval.
$baseArgs = @("-s", "workspace-write", "-a", "on-request")
& "codex" @baseArgs @Args

# Return Codex exit code to the caller.
if ($LASTEXITCODE -ne $null) {
    exit $LASTEXITCODE
}
