 Copyright:      Hagen Reddmann  mailto:HaReddmann@AOL.COM
 Author:         Hagen Reddmann
 Remarks:        freeware
 known Problems: none
 Version:        2.3,  Part I from Delphi Encryption Compendium
                 Delphi 2-4, BCB 3-4, designed and testet with D3 and D4
 Description:    This Packages include various Hash-, Checksum-, Encryptionalgortihm,
                 Secure Random Number Generator and Demo's in full Sources

 Algorithms:  23 Hash:      MD4, MD5, 
                            SHA (other Name SHS), SHA1, 
                            RipeMD128, RipeMD160, RipeMD256, RipeMD320, 
                            Haval (128, 160, 192, 224, 256) with Rounds, 
                            Snefru, Square, Tiger
                            Sapphire II (128, 160, 192, 224, 256, 288, 320)

               5 Checksum:  CRC32, XOR32bit, XOR16bit, CRC16-CCITT, CRC16-Standard

              40 Cipher:    Gost, Cast128, Cast256, Blowfish, IDEA
                            Mars, Misty 1, RC2, RC4, RC5, RC6, FROG, Rijndael,
                            SAFER, SAFER-K40, SAFER-SK40,SAFER-K64, SAFER-SK64, 
                            SAFER-K128, SAFER-SK128, TEA, TEAN, Skipjack, SCOP, 
                            Q128, 3Way, Twofish, Shark, Square, Single DES, Double DES,
                            Triple DES, Double DES16, Triple DES16, TripleDES24, 
                            DESX, NewDES, Diamond II, Diamond II Lite, Sapphire II			

 Features:     - Self Test Support
               - Progress Event
               - fast implementation  (i.E. MD4 > 27 Mb/sec, Blowfish > 6.6 Mb/sec)
               - Secure Random Number Generator (RNG, PNG)       
               - Designtime Manager Components for Hash/Cipher's
               - Low Level API to access without Delphi or BCB
               - HEX and MIME Base 64 converting
               - full and easy to use objectorientated 
              
 Installation:         unzip Cipher.zip with Path's
                       register the HCMngr.pas as Component.          

 to anonyme Designers: send me your ideas or remarks or implement more hash's and
                       cipher's to make this Packages to the biggest for Delphi and BCB :-)
                       (i.E. Cipher WAKE, LOKI97, Serpent, Yarrow, DEAL, SEAL, 
                                    FEAL, NSEA, REDOC II & III, Lucifer, a3a8 
                                    and many more, but to many for me)
                           
 Copyright, Licensing: many Algorithm in this Packages have restriction for use, check
		       the law in your country, any Patents or Copyrights
                       before use this Packages. 

 * THIS SOFTWARE IS PROVIDED BY THE AUTHORS ''AS IS'' AND ANY EXPRESS
 * OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHORS OR CONTRIBUTORS BE
 * LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR
 * CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF
 * SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR
 * BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE
 * OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.        


 Specials:             I have the files Demo.exe, DEC_Samp.exe and DEC1.DLL compressed
                       with the powerfull ASPack (Rate > 50%) from Alexey Solodovnikov at
                       http:\\www.entechtaiwan.com\aspack.htm               

-------------------------------------------------------------------------------------------

 History:     Beginning at Feb 1999 to May 1999

-------------------------------------------------------------------------------------------

 Version 2.3
   
  maked compatible with BCB 3 and 4, removed all abstract Methods and NewInstance Methods. 
  
  new:            Secure Random Number Generator with a Period 2^256-1
                  included in RNG.pas 
  added:          in Hash.pas and Cipher.pas Secure Random Number Generator Support

  specialy:       removed all fucking LOOP Statements in assembler core, 
                  it's slow and produced bad iteration
                  as result: all Checksums speeded very up and
                             all Ciphers in cmCBC and cmCTS Mode speeded up 
                             (i.E. TCipher_SCOP from 22 Mb/sec to 28 Mb/sec)

-------------------------------------------------------------------------------------------
 
 Version 2.2  
   
  added Cipher:   Square, all DES Cipher 7 types, Diamond II, Diamond II Lite, Sapphire II
  added Hash:	  SHA, Square, Sapphire II (128, 160, 192, 224, 256, 288, 320)
  added Checksum: CRC16-CCITT Norm, CRC16-Standard Norm (XModem, ARC)

  bugfixes:       CRC32 offset Problem and in THash_CRC32.Done inverse the Result
                  Overlapping in TCipher.InternalCodeStream
                  DecodeString was called EncodeBuffer, now Decodebuffer

  added:	  ProgressEvent (Gauges) for Cipher's and Hash's
		  Event OnProgress from TCipherManager and THashManager

  added:          more Examples

  changed:        DEC1 API, added a Demo to using DEC1.DLL
      
                  cmCTS Mode, XOR's the Data before and now after the encryption.
                  This has better Securityeffect when using a InitVector, the Output is
                  secure when a bad InitVector is used, ca 1% Speed lossed
                  cmCBC Mode is now equal to the old cmCTS Mode.  


-------------------------------------------------------------------------------------------

 Version 2.1
   
  added:          Self-Test support, Methods TCipher.SelfTest and TCipher.TestVector
                                     Methods THash.SelfTest and THash.TestVector
 
                  Cipher KeySize-checking, Method TCipher.InitBegin()
                  Cipher Init-checking, property TCipher.Initialized


  added Cipher:   TEAN, SCOP (very fast), Q128, 3Way, Twofish, Shark
  added Hash:     Snefru, RipeMD128, RipeMD256, RipeMD320, Tiger


  added Rounds for THaval_xxxx, from 3-5 

        3 Rounds 174 % faster than with 5 Rounds, PII 266 12.74 Mb/sec
        4 Rounds 121 % faster than with 5 Rounds, PII 266  8.88 mb/sec
        5 Rounds                                  PII 266  7.32 mb/sec

        THash_Haval256           default Rounds is 5
        THash_Haval224 / 192     default Rounds is 4
        THash_Haval160 / 128     default Rounds is 3

  added in TCipherManager: Methods EncodeString(), DecodeString(), 
                                   EncodeBuffer(), DecodeBuffer()

  added Low Level API in unit DEC_API.pas and Low Level DLL for use without Delphi


  changed:        Endian conversions routines, SwapInteger and SwapIntegerBuffer 
                  use now Processor specific code to speedup the conversion

  bug fixes:      assember code in XORBuffers save now register EDI
                  TCipher.EncodeString and DecodeString changed,
                  old code produced Access Violation's

  speeded up:     TCipher_Cast128   145 %
                  TCipher_Cast256   118 %
                  TCipher_Blowfish  130 %
                  TCipher_Gost      139 %
                  TCipher_Mars      125 %

  speeded up:     THash_MD4         137 %
                  THash_MD5         126 %
                  THash_SHA1        134 % for <= 386   and 148 % for >= 486 CPU
                  THash_RipeMD160   140 %
                  THash_Haval       173 %

-------------------------------------------------------------------------------------------


     