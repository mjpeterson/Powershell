Param (
[Parameter(Mandatory=$True,ValueFromPipeline=$True,ValueFromPipelineByPropertyName=$True)]
$Word
)

$url = "https://od-api.oxforddictionaries.com:443/api/v1/entries/en/$($word)"
$headers = @{}
$headers.Add("app_id", "<your app id>")
$headers.Add("app_key","<your app key>")

try
{
    $response = Invoke-WebRequest -Uri $url -Headers $headers
    $json = ConvertFrom-Json $response.Content
    if($json -ne $Null)
    {
        $json.results.lexicalEntries.entries.senses.definitions
    }
}
catch
{
    Write-Host -ForegroundColor White -BackgroundColor Red "Word $($Word) not found"
}

