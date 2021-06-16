
$name = ((Get-Clipboard) + '').ToLower()

if ($name.StartsWith("https://")) {
    $name = $name.Substring(8);
}

if ($name.StartsWith("http://")) {
    $name = $name.Substring(7);
}

if ($name.Contains("/")) {
    $name = $name.Substring(0, $name.IndexOf("/"))
}

if ($name.Contains(".")) {
    $name = $name.Substring(0, $name.LastIndexOf("."))
}

if ($name.Contains(".")) {
    $name = $name.Substring($name.IndexOf(".") + 1)
}

$mainPassword = Read-Host 'Enter the main password'
$str = $name + $mainPassword + '&rLp5gWWnH6&j*@wHn6S'
$algo = [System.Security.Cryptography.SHA256]::Create()
$bytes = [System.Text.Encoding]::UTF8.GetBytes($str)
$bytes = $algo.ComputeHash($bytes)
$hexStrings = $bytes | ForEach { $_.ToString('X2') }
$pw = $hexStrings | Join-String
$pw = $pw.Substring(0, 16) + '+1aA'
$pw | Set-Clipboard

write ""
write "Name:     $name"
write ""
write "Password: $pw"
write ""
write 'The password was copied to the clipboard.'
write ""
