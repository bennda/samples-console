param(
    [ValidateSet('echo', 'random')]
    [Parameter(Mandatory = $false)]
    [string]$Mode = 'echo',

    [Parameter(Mandatory = $false)]
    [string]$Text = '',

    [Parameter(Mandatory = $false)]
    [int]$RandomMinimum = 0,

    [Parameter(Mandatory = $false)]
    [int]$RandomMaximum = 1000
)

function Get-RandomInt {
    param (
        [Parameter(Mandatory = $true)]
        [int]$Minimum,

        [Parameter(Mandatory = $true)]
        [int]$Maximum
    )

    $random = Get-Random -Minimum $Minimum -Maximum $Maximum 
    return $random
}

switch ($Mode) {
    'echo' {
        $result = "$Text"
    }
    'random' {
        $result = "$(Get-RandomInt -Minimum $RandomMinimum -Maximum $RandomMaximum)"
    }
}

Write-Host "$result"