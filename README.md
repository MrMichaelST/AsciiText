# AsciiText
Powershell script to convert text to ASCII art text. Includes many fonts.

Install from PS Gallery via : 

PC> Install-Module AsciiText

```

Basic usage

PS> "ABCabc123" | Write-AsciiText

   _____  ___________________        ___.           ____________ ________    
  /  _  \ \______   \_   ___ \_____  \_ |__   ____ /_   \_____  \\_____  \   
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ |   |/  ____/  _(__  <  
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ |   /       \ /       \
\____|__  /|______  /\______  (____  /|___  /\___  >|___\_______ /______  /
        \/        \/        \/     \/     \/     \/             \/      \/         `

PS> Write-AsciiText -Text "ABCabc123"
   _____  ___________________        ___.           ____________ ________  
  /  _  \ \______   \_   ___ \_____  \_ |__   ____ /_   \_____  \\_____  \ 
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ |   |/  ____/  _(__  < 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ |   /       \ /       \
\____|__  /|______  /\______  (____  /|___  /\___  >|___\_______ /______  /
        \/        \/        \/     \/     \/     \/             \/      \/ 

Different Fonts by name
PS> Write-AsciiText -Text "ABCabc123" -FontName Arrows
      >>       >=>>=>        >=>                >=>                                      
     >>=>      >>   >=>   >=>   >=>             >=>              >=>    >=>>=>  >=>>=>   
    >> >=>     >>    >=> >=>           >=> >=>  >=>         >==>  >=>  >>   >=>    >=>   
   >=>  >=>    >==>>=>   >=>         >=>   >=>  >=>>==>   >=>     >=>      >=>   >=>     
  >=====>>=>   >>    >=> >=>        >=>    >=>  >=>  >=> >=>      >=>     >=>       >=>  
 >=>      >=>  >>     >>  >=>   >=>  >=>   >=>  >=>  >=>  >=>     >=>   >=>          >=> 
>=>        >=> >===>>=>     >===>     >==>>>==> >=>>==>     >==> >===> >======> >====>   
                                                                                         

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman
 ____,  ____   ____,    ____,  ____   ____,  ___,  __,   __, 
 (-/_|  (-|__) (-/     (-/_|  (-|__) (-/    (-/|  (- )  (-_) 
 _/  |,  _|__)  _\__,  _/  |,  _|__)  _\__,  '_|,  ,'_,  __) 
(       (      (      (       (      (       (    (     (    

PS> Write-AsciiText -Text "ABCabc123" -FontName Digital
+-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ 
|A| |B| |C| |a| |b| |c| |1| |2| |3| 
+-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ 

PS> Write-AsciiText -Text "ABCabc123" -FontName EftiFont
  _    ___    __               _   __   ___ 
 / \  | o )  / _|  _   ||   _ /o| [o ) |_ / 
| o | | o \ ( (_  /o\  |o\ //  ||  /(  __)\ 
|_n_| |___/  \__| \_,] |_/ \\  L| /__| \__/ 
                                            


Different LetterSpacing on same font.
PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing 1
 ____,  ____   ____,    ____,  ____   ____,  ___,  __,   __, 
 (-/_|  (-|__) (-/     (-/_|  (-|__) (-/    (-/|  (- )  (-_) 
 _/  |,  _|__)  _\__,  _/  |,  _|__)  _\__,  '_|,  ,'_,  __) 
(       (      (      (       (      (       (    (     (    

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing 0
 ____, ____  ____,   ____, ____  ____, ___, __,  __,
 (-/_| (-|__)(-/    (-/_| (-|__)(-/   (-/| (- ) (-_)
 _/  |, _|__) _\__, _/  |, _|__) _\__, '_|, ,'_, __)
(      (     (     (      (     (      (   (    (   

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing -1
 ____,____ ____,  ____,____ ____,___,__, __,
 (-/_|(-|__(-/   (-/_|(-|__(-/  (-/|(- )(-_)
 _/  |,_|__)_\__,_/  |,_|__)_\__,'_|,,'_,__)
(     (    (    (     (    (     (  (   (   

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing -2
 ____________, _________________,__,
 (-/_(-|_(-/  (-/_(-|_(-/ (-/(- (-_)
 _/  |_|___\___/  |_|___\__'_|,'___)
(    (   (   (    (   (    ( (  (   

Load font and reuse it a few times - faster but wont be noticeable unless many lines.
PS> $Font = Get-Font -FontName EftiFont
PS> Write-AsciiText -Text "Some text" -Font $Font
 __                                  
/ _|  _    _ _   _   ||   _      ||  
\_ \ /o\ |/ \ \ /o\  | ] /o\ \V7 | ] 
|__/ \_/ L_n_n| \(   L|  \(  /n\ L|  
                                     

PS> Write-AsciiText -Text "Other text" -Font $Font
  _                                    
 / \  ||  ||   _   _   ||   _      ||  
( o ) | ] | \ /o\ /_|  | ] /o\ \V7 | ] 
 \_/  L|  Ln| \(  L|   L|  \(  /n\ L|  
                                       

Get AsciiText in [string[]] for later use or save to file instead of displaying now
PS> $Font = Get-Font -FontName EftiFont

PS> Get-AsciiText -Text "Some text" -Font $Font
 __                                  
/ _|  _    _ _   _   ||   _      ||  
\_ \ /o\ |/ \ \ /o\  | ] /o\ \V7 | ] 
|__/ \_/ L_n_n| \(   L|  \(  /n\ L|  
                                     


Set colours
PS> Write-AsciiText -Text "ABCabc123" -ForegroundColor Red -BackgroundColor DarkGreen

   _____  ___________________        ___.           ____________ ________  
  /  _  \ \______   \_   ___ \_____  \_ |__   ____ /_   \_____  \\_____  \ 
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ |   |/  ____/  _(__  < 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ |   /       \ /       \
\____|__  /|______  /\______  (____  /|___  /\___  >|___\_______ /______  /
        \/        \/        \/     \/     \/     \/             \/      \/ 


Get list of allowable FontNames
PS> Show-Font
3DDiagonal
Arrows
ASCIINewRoman
Avatar
Big
Caligraphy
Chunky
Contessa
Digital
Doom
EftiFont
EftiRobot
Graceful
Graffiti
Impossible
LilDevil
Merlin1
Modular
Ogre
Pepper
Rectangles
SmallShadow
```
Stop

PS> `# AsciiText
Powershell script to convert text to ASCII art text. Includes many fonts.



```
Basic usage
PS> "ABCabc123" | Write-AsciiText

   _____  ___________________        ___.           ____________ ________     
  /  _  \ \______   \_   ___ \_____  \_ |__   ____ /_   \_____  \\_____  \   
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ |   |/  ____/  _(__  <  
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ |   /       \ /       \
\____|__  /|______  /\______  (____  /|___  /\___  >|___\_______ /______  /
        \/        \/        \/     \/     \/     \/             \/      \/ 
        

PS> Write-AsciiText -Text "ABCabc123"
   _____  ___________________        ___.           ____________ ________  
  /  _  \ \______   \_   ___ \_____  \_ |__   ____ /_   \_____  \\_____  \ 
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ |   |/  ____/  _(__  < 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ |   /       \ /       \
\____|__  /|______  /\______  (____  /|___  /\___  >|___\_______ /______  /
        \/        \/        \/     \/     \/     \/             \/      \/ 


Different Fonts by name
PS> Write-AsciiText -Text "ABCabc123" -FontName Arrows
      >>       >=>>=>        >=>                >=>                                      
     >>=>      >>   >=>   >=>   >=>             >=>              >=>    >=>>=>  >=>>=>   
    >> >=>     >>    >=> >=>           >=> >=>  >=>         >==>  >=>  >>   >=>    >=>   
   >=>  >=>    >==>>=>   >=>         >=>   >=>  >=>>==>   >=>     >=>      >=>   >=>     
  >=====>>=>   >>    >=> >=>        >=>    >=>  >=>  >=> >=>      >=>     >=>       >=>  
 >=>      >=>  >>     >>  >=>   >=>  >=>   >=>  >=>  >=>  >=>     >=>   >=>          >=> 
>=>        >=> >===>>=>     >===>     >==>>>==> >=>>==>     >==> >===> >======> >====>   
                                                                                         

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman
 ____,  ____   ____,    ____,  ____   ____,  ___,  __,   __, 
 (-/_|  (-|__) (-/     (-/_|  (-|__) (-/    (-/|  (- )  (-_) 
 _/  |,  _|__)  _\__,  _/  |,  _|__)  _\__,  '_|,  ,'_,  __) 
(       (      (      (       (      (       (    (     (    

PS> Write-AsciiText -Text "ABCabc123" -FontName Digital
+-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ 
|A| |B| |C| |a| |b| |c| |1| |2| |3| 
+-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ +-+ 

PS> Write-AsciiText -Text "ABCabc123" -FontName EftiFont
  _    ___    __               _   __   ___ 
 / \  | o )  / _|  _   ||   _ /o| [o ) |_ / 
| o | | o \ ( (_  /o\  |o\ //  ||  /(  __)\ 
|_n_| |___/  \__| \_,] |_/ \\  L| /__| \__/ 
                                            


Different LetterSpacing on same font.
PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing 1
 ____,  ____   ____,    ____,  ____   ____,  ___,  __,   __, 
 (-/_|  (-|__) (-/     (-/_|  (-|__) (-/    (-/|  (- )  (-_) 
 _/  |,  _|__)  _\__,  _/  |,  _|__)  _\__,  '_|,  ,'_,  __) 
(       (      (      (       (      (       (    (     (    

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing 0
 ____, ____  ____,   ____, ____  ____, ___, __,  __,
 (-/_| (-|__)(-/    (-/_| (-|__)(-/   (-/| (- ) (-_)
 _/  |, _|__) _\__, _/  |, _|__) _\__, '_|, ,'_, __)
(      (     (     (      (     (      (   (    (   

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing -1
 ____,____ ____,  ____,____ ____,___,__, __,
 (-/_|(-|__(-/   (-/_|(-|__(-/  (-/|(- )(-_)
 _/  |,_|__)_\__,_/  |,_|__)_\__,'_|,,'_,__)
(     (    (    (     (    (     (  (   (   

PS> Write-AsciiText -Text "ABCabc123" -FontName ASCIINewRoman -LetterSpacing -2
 ____________, _________________,__,
 (-/_(-|_(-/  (-/_(-|_(-/ (-/(- (-_)
 _/  |_|___\___/  |_|___\__'_|,'___)
(    (   (   (    (   (    ( (  (   

Load font and reuse it a few times - faster but wont be noticeable unless many lines.
PS> $Font = Get-Font -FontName EftiFont
PS> Write-AsciiText -Text "Some text" -Font $Font
 __                                  
/ _|  _    _ _   _   ||   _      ||  
\_ \ /o\ |/ \ \ /o\  | ] /o\ \V7 | ] 
|__/ \_/ L_n_n| \(   L|  \(  /n\ L|  
                                     

PS> Write-AsciiText -Text "Other text" -Font $Font
  _                                    
 / \  ||  ||   _   _   ||   _      ||  
( o ) | ] | \ /o\ /_|  | ] /o\ \V7 | ] 
 \_/  L|  Ln| \(  L|   L|  \(  /n\ L|  
                                       

Get AsciiText in [string[]] for later use or save to file instead of displaying now
PS> $Font = Get-Font -FontName EftiFont

PS> Get-AsciiText -Text "Some text" -Font $Font
 __                                  
/ _|  _    _ _   _   ||   _      ||  
\_ \ /o\ |/ \ \ /o\  | ] /o\ \V7 | ] 
|__/ \_/ L_n_n| \(   L|  \(  /n\ L|  
                                     


Set colours
PS> Write-AsciiText -Text "ABCabc123" -ForegroundColor Red -BackgroundColor DarkGreen

   _____  ___________________        ___.           ____________ ________  
  /  _  \ \______   \_   ___ \_____  \_ |__   ____ /_   \_____  \\_____  \ 
 /  /_\  \ |    |  _/    \  \/\__  \  | __ \_/ ___\ |   |/  ____/  _(__  < 
/    |    \|    |   \     \____/ __ \_| \_\ \  \___ |   /       \ /       \
\____|__  /|______  /\______  (____  /|___  /\___  >|___\_______ /______  /
        \/        \/        \/     \/     \/     \/             \/      \/ 


Get list of allowable FontNames
PS> Show-Font
3DDiagonal
Arrows
ASCIINewRoman
Avatar
Big
Caligraphy
Chunky
Contessa
Digital
Doom
EftiFont
EftiRobot
Graceful
Graffiti
Impossible
LilDevil
Merlin1
Modular
Ogre
Pepper
Rectangles
SmallShadow
Stop
```
