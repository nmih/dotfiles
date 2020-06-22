# https://github.com/dracula/powershell
# Dracula readline configuration. Requires version 2.0, if you have 1.2 convert to `Set-PSReadlineOption -TokenType`
Set-PSReadlineOption -Color @{
    "Command" = [ConsoleColor]::Green
    "Parameter" = [ConsoleColor]::Gray
    "Operator" = [ConsoleColor]::Magenta
    "Variable" = [ConsoleColor]::White
    "String" = [ConsoleColor]::Yellow
    "Number" = [ConsoleColor]::Blue
    "Type" = [ConsoleColor]::Cyan
    "Comment" = [ConsoleColor]::DarkCyan
}
# Dracula Prompt Configuration
Import-Module posh-git
$GitPromptSettings.DefaultPromptPrefix.Text = "$([char]0x2192) " # arrow unicode symbol
$GitPromptSettings.DefaultPromptPrefix.ForegroundColor = [ConsoleColor]::Green
$GitPromptSettings.DefaultPromptPath.ForegroundColor =[ConsoleColor]::Cyan
$GitPromptSettings.DefaultPromptSuffix.Text = "$([char]0x203A) " # chevron unicode symbol
$GitPromptSettings.DefaultPromptSuffix.ForegroundColor = [ConsoleColor]::Magenta
# Dracula Git Status Configuration
$GitPromptSettings.BeforeStatus.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.BranchColor.ForegroundColor = [ConsoleColor]::Blue
$GitPromptSettings.AfterStatus.ForegroundColor = [ConsoleColor]::Blue


# https://stackoverflow.com/questions/12144016/cd-in-powershell-to-cd-plus-ls
function Set-LocationWithGCI{
    param(
            $path
         )
    if(Test-Path $path){
        $path = Resolve-Path $path
        Set-Location $path
        Get-ChildItem $path
    }else{
        "Could not find path $path"
    }
}
Set-Alias cs Set-LocationWithGCI -Force


# https://stackoverflow.com/questions/9440639/sublime-text-from-command-line
Set-Alias subl 'C:\Program Files\Sublime Text 3\subl.exe'
