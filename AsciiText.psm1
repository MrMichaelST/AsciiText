function Write-AsciiText{
<#
.SYNOPSIS

Displays plain text as ASCII art text.

.DESCRIPTION

Takes plain text and converts to string array containing ASCII art text. Can supply preloaded Font as returned
byb Get-Font or specify a valid FontName as retunrned by Show font, otherwise defaults to Graffiti font
List of fonts (Can use as value for FontName ) :
3DDiagonal, Arrows, ASCIINewRoman, Avatar, Big, Caligraphy, Chunky, Contessa, Digital, Doom, EftiFont, EftiRobot,
 Graceful, Graffiti, Impossible, LilDevil, Merlin1, Modular, Ogre, Pepper, Rectangles, SmallShadow, Stop

Does not work well when outpuit is wider that console width.

Fonts templates taken from http://patorjk.com/software/taag

.PARAMETER Text
Text to convert

.PARAMETER Font
Font hastable obtained via Get-Font

.PARAMETER FontName
Name of Font. Get list of avaible Fonts via Show-Font. Either Font or FontName must be provided.

.PARAMETER LetterSpacing
Specifies letter spacing. Value of 1 will have a single space between letters, 0 will have none. -1 will
 smoosh them toghter a bit, -2 a bit more. If not specified will revert to default.

.INPUTS

None.

.OUTPUTS

None.

.EXAMPLE
Display text with default font.
PS>  Write-AsciiText -Text 
   _____  ___________________        ___.           
  /  _  \ \______   \_   ___ \_____  \_ |__   ____  
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ 
\____|__  /|______  /\______  (____  /|___  /\___  >
        \/        \/        \/     \/     \/     \/  
.EXAMPLE
Display text with default font, input via pipeline.
PS>  "ABCabc" | Write-AsciiText
   _____  ___________________        ___.           
  /  _  \ \______   \_   ___ \_____  \_ |__   ____  
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ 
\____|__  /|______  /\______  (____  /|___  /\___  >
        \/        \/        \/     \/     \/     \/  


.EXAMPLE
Loads font SmallShadow by name and print text with default spacing.
PS>  Write-AsciiText -Text "ABCabc" -FontName SmallShadow;
   \    _ )   __|         |         
  _ \   _ \  (      _` |   _ \   _| 
_/  _\ ___/ \___| \__,_| _.__/ \__| 

.EXAMPLE
Loads font SmallShadow by name and print text with no spacing.
PS>  Write-AsciiText -Text "ABCabc" -FontName SmallShadow -LetterSpacing 0;
   \   _ )  __|       |       
  _ \  _ \ (     _` |  _ \  _|
_/  _\___/\___|\__,_|_.__/\__| 

.EXAMPLE
Loads font SmallShadow by name and print text with large spacing spacing and colors.
PS>  Write-AsciiText -Text "ABCabc" -FontName SmallShadow -LetterSpacing 2 -ForegroundColor Green -BackgroundColor RED;
   \   _ )  __|       |       
  _ \  _ \ (     _` |  _ \  _|
_/  _\___/\___|\__,_|_.__/\__| 
.EXAMPLE
Loads font Graffiti by name and print text with smoosh spacing.
PS>  Write-AsciiText -Text "ABCabc" -FontName Graffiti -LetterSpacing -1;
   _____  ___________________        ___.           
  /  _  \ \______   \_   ___ \_____  \_ |__   ____  
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ 
\____|__  /|______  /\______  (____  /|___  /\___  >
        \/        \/        \/     \/     \/     \/ 


.EXAMPLE
Loads font SmallShadow by name and print text with default spacing.
PS>  Write-AsciiText -Text "ABCabc" -FontName Graffiti -LetterSpacing -1 -ForegroundColor Green;
   _____  ___________________        ___.           
  /  _  \ \______   \_   ___ \_____  \_ |__   ____  
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ 
\____|__  /|______  /\______  (____  /|___  /\___  >
        \/        \/        \/     \/     \/     \/  

.EXAMPLE

PS> Write-AsciiText -Text "ABCabc" -Font (Get-Font -FontName "Graffiti") -LetterSpacing -2;
   _____ __________________      ___.          
  /  _  \\______  \_   ___ _____ \_ |__  ____  
 /  /_\  \|    |  /    \  \\__  \ | __ _/ ___\ 
/    |    |    |  \     \___/ __ \| \_\\  \___ 
\____|__  |______  \______ (____  |___  \___  >
        \/       \/       \/    \/    \/    \/ 

.EXAMPLE
Loads a Font then uses it to write text. This is faster is reusing font a lot.
PS> $Font = Get-Font -FontName Chunky
PS> Write-AsciiText -Text "ABCabc" -Font $Font;
_______   ______   ______           __            
|   _   | |   __ \ |      | .---.-. |  |--. .----. 
|       | |   __ < |   ---| |  _  | |  _  | |  __| 
|___|___| |______/ |______| |___._| |_____| |____| 


#>
    param( 
        [Parameter(Mandatory=$true,ValueFromPipeline = $True)][AllowEmptyString()][string]$Text,
        [Parameter(Mandatory=$false)][hashtable]$Font=$null,
        [Parameter(Mandatory=$false)][ValidateSet("3DDiagonal", "Arrows", "ASCIINewRoman", "Avatar", "Big",
           "Caligraphy", "Chunky", "Contessa", "Digital", "Doom", "EftiFont", 
           "EftiRobot", "Graceful", "Graffiti", "Impossible", "LilDevil",
           "Merlin1", "Modular", "Ogre", "Pepper", "Rectangles", "SmallShadow",
           "Stop")][AllowEmptyString()][string]$FontName,
        [Parameter(Mandatory=$false)][int]$LetterSpacing = -999,
        [Parameter(Mandatory=$false)][ConsoleColor]$ForegroundColor,
        [Parameter(Mandatory=$false)][ConsoleColor]$BackgroundColor
    )

    if(($Font -eq $null) -and ($FontName -eq $null)){
        $Font = Get-Font "Graffiti" # Default font
    }
    if($Font -eq $null){
        $FontNames = Show-Font
        if($FontNames -contains $FontName){
            $Font = Get-Font $FontName
        }
        else{
            $Font = Get-Font "Graffiti" # Default font
        }
    }

    [string[]]$OutPutRows = Get-AsciiText -Text $Text -Font $Font -LetterSpacing $LetterSpacing;
    $OutPutRows | ForEach-Object{
        if(($null -ne $ForegroundColor) -and ($null -ne $BackgroundColor)){
             Write-Host -Object $_ -ForegroundColor $ForegroundColor -BackgroundColor $BackgroundColor;
        }elseif(($null -eq $ForegroundColor) -and ($null -eq $BackgroundColor)){
              Write-Host -Object $_ ;
        }elseif(($null -eq $ForegroundColor) -and ($null -ne $BackgroundColor)){
             Write-Host -Object $_ -BackgroundColor $BackgroundColor;
        }elseif(($null -ne $ForegroundColor) -and ($null -eq $BackgroundColor)){
            Write-Host -Object $_  -ForegroundColor $ForegroundColor;
        }
    }
}
function Add-Letter{
<#
.SYNOPSIS

Used by Get-Font to process letters.

.DESCRIPTION
#>
    param( 
        [Parameter(Mandatory=$true)][AllowEmptyString()][string]$fromChars,
        [Parameter(Mandatory=$true)][AllowEmptyCollection()][string[]]$toLines,
        [Parameter(Mandatory=$true)][hashtable]$FontHash
    )
    if($fromChars -ne ""){
        $width = 0;
        foreach($toLine in $toLines){
            if($toLine.length -gt $width){ $width =  $toLine.length} 
        }
        $letter = @{
            Letter = $toLines
            Width = $width
        }
        $chars = $fromChars.ToCharArray()
        foreach($char in $chars){
            if(-not $FontHash.ContainsKey($char)){
                $FontHash.Add($char,$letter);
            }
            else{
                # Duplicate from letter, ignore
            }
        }
    }
}

function Show-Font{
<#
.SYNOPSIS

Returns list of available Fonts in String array.

.DESCRIPTION

Returns String array of available font names.

.INPUTS

None.

.OUTPUTS

String array of avaible fonts.

.EXAMPLE
Show list of fonts.
PS> Show-Font
DDiagonal
Arrows
..
..

#>
    [string[]] $ret = @();
    Get-ChildItem -Path (Join-Path -Path $PSScriptRoot -ChildPath "Fonts") -Filter *.psf* -File | ForEach-Object{
        $ret += $_.Name.replace(".psf","");
    }
    return $ret;
}

function Get-Font{
<#
.SYNOPSIS

Loads ASCII font. 

.DESCRIPTION

Given name of font, loads from .psf file the letters and formating info.

.PARAMETER FontName
Name of the font file without the trailing .psf


.OUTPUTS

Hashtable of the font.

.EXAMPLE
Loads font
PS> $Font = Get-Font -FontName "Graffiti"

.EXAMPLE
Loads Font
PS> $Font = Get-Font -FontName EftiRobot

.EXAMPLE
Displays comment assicatioed with font.
(Get-Font -FontName EftiRobot).Comment



#>
    param( 
        [ValidateSet("3DDiagonal", "Arrows", "ASCIINewRoman", "Avatar", "Big",
           "Caligraphy", "Chunky", "Contessa", "Digital", "Doom", "EftiFont", 
           "EftiRobot", "Graceful", "Graffiti", "Impossible", "LilDevil",
           "Merlin1", "Modular", "Ogre", "Pepper", "Rectangles", "SmallShadow",
           "Stop")][Parameter(Mandatory=$true)][AllowEmptyString()][string]$FontName
    )

    $fromDelim = $null;
    $toDelim = $null;
    enum LoadStatus {
       LoadingFrom
       LoadingTo
       LoadingComment
       None
       EOF
    }
    $data = Get-Content (Join-Path -Path (Join-Path -Path $PSScriptRoot -ChildPath "Fonts") -ChildPath "$FontName.psf");
    $fontName  = $data[0];
    $extraParamCount = $data[1];
    $fromDelim  = $data[2];
    $toDelim  = $data[3];
    $commentDelim = $data[4];
    $DefaultSpacing = [int]$data[5];
    $EOFDelin  = $data[6];
    $FontHash = @{};
    [LoadStatus] $loadStatus = [LoadStatus]::None

    $fromChars = $null;
    $toLines = @();
    $commentLine = ""

    for($i = 7;$i -lt $data.Count;$i++){
    
        $line = $data[$i];

        if($line -eq $fromDelim){
            $loadStatus = [LoadStatus]::LoadingFrom;
        }
        elseif($line -eq $toDelim){
            $loadStatus = [LoadStatus]::LoadingTo;
        }
        elseif($line -eq $commentDelim){
            $loadStatus = [LoadStatus]::LoadingComment;
        }
        elseif($line -eq $EOFDelin){
            Add-Letter -fromChars $fromChars -toLines $toLines -FontHash $FontHash;
            $loadStatus = [LoadStatus]::None;
            break;
        }
        else{
            switch($loadStatus) {
                LoadingFrom {
                    Add-Letter -fromChars $fromChars -toLines $toLines -FontHash $FontHash;
                    $fromChars = "";
                    $toLines = @();

                    $fromChars = $line;
                    $loadStatus = [LoadStatus]::None;
                }
                
                LoadingTo {
                    $toLines += $line;
                }
                LoadingComment {
                    $commentLine += $line + "`n";
                }
                None {
 
                }
                default{
                    write-host "Should never see this" -ForegroundColor Red;
                }
            }
        }

    }

    $MaxHeigh = 0;
    foreach($key in $FontHash.Keys){
    
        if($FontHash[$key].Letter.Count -gt $MaxHeigh) {
            $MaxHeigh = $FontHash[$key].Letter.Count;
        }
    }
    $Font = @{
        MaxHeigh = $MaxHeigh
        FontHash = $FontHash
        Comment = $commentLine
        DefaultSpacing = $DefaultSpacing
    }
    return $Font;
}


function Get-AsciiText{
<#
.SYNOPSIS

Converts plain text to ASCII art text.

.DESCRIPTION

Takes plain text and converts to string array containing ASCII art text.

.PARAMETER Text
Text to convert

.PARAMETER Font
Font hastable obtained via Get-Font

.PARAMETER LetterSpacing
Specifies letter spacing. Value of 1 will have a single space between letters, 0 will have none. -1 will
 smoosh them toghter a bit, -2 a bit more. If not specified will revert to default.

.INPUTS

None.

.OUTPUTS

None.

.EXAMPLE

PS>  $ASCIIText = Get-AsciiText -Text "ABCabc" -Font $AFontPreloaded;

.EXAMPLE

PS>  $ASCIIText = Get-AsciiText -Text "ABCabc" -Font $AFontPreloaded -LetterSpacing 0;

.EXAMPLE

PS>  $ASCIIText = Get-AsciiText -Text "ABCabc" -Font (Get-Font -FontName "Graffiti") -LetterSpacing 0;

#>
    param( 
        [Parameter(Mandatory=$true)][AllowEmptyString()][string]$Text,
        [Parameter(Mandatory=$true)][hashtable]$Font,
        [Parameter(Mandatory=$false)][int]$LetterSpacing =-999
    )

    if($LetterSpacing -eq -999){
        $LetterSpacing = $Font.DefaultSpacing;
    }

    [String[]] $OutPutRows = New-Object String[] $Font.MaxHeigh #[$Font.MaxHeigh];
    foreach($char in $Text.ToCharArray()){
        if($Font.FontHash.ContainsKey([Char]$char)){
            $Letter = $Font.FontHash[[Char]$char].Letter;
            $Width = $Font.FontHash[[Char]$char].Width;
            for($i=0; $i -lt $Font.MaxHeigh; $i++){
                if($LetterSpacing -ge 0){
                    $OutPutRows[$i] += $Letter[$i].PadRight( $Width + $LetterSpacing);
                }
                else{
                    if(($null -ne $OutPutRows[$i]) -and ($OutPutRows[$i].Length -ge ($LetterSpacing * -1))){
                        $frontSpace = 0;
                        for($k = 0; ($k -lt $($LetterSpacing * -1)) -and ($k -lt $Letter[$i].Length); $k++){
              
                            if($Letter[$i].substring($k,1) -eq ' '){
                                $frontSpace++;
                            }
                            else{
                            break;
                            }
                        }
                        $OutPutRows[$i] = $OutPutRows[$i].Substring(0, ($OutPutRows[$i].Length + $LetterSpacing+$frontSpace))+  $Letter[$i].substring($frontSpace, ($Letter[$i].length - $frontSpace));
                    }
                    else{ # first letter, do normal
                        $OutPutRows[$i] += $Letter[$i];
                    }
                }

            }
        }
        else{ # If mathcing letter in font, just use the input char. Should only get here for <space> char.
            for($i=0; $i -lt $Font.MaxHeigh; $i++){
                $OutPutRows[$i] += $char;
            }
        }

    }
    return $OutPutRows
}

