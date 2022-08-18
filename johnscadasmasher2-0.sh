
#!/bin/bash


PS3= 'This is a basic script to enumerate ICS/SCADA systems. Please run as sudo and stay legal. Please see instructions for command info. Choose your weapons'

#prompt for selection

damage=("SecretPing" "SkipHost" "SpoofIP" "ModbusDiscover" "s7-info" "Check-IEC-60870-5-104" "Aggressive" "Instructions" "Research")

#create array

select dirtyinfo in "${damage[@]}";do

#Gives Menu for Select Statement
case $dirtyinfo in

#Gives Case Statement

  "SecretPing")
   echo "What is the IP you want to test?: "
   read $ip
   sudo nping --send-eth -tcp $ip
   break
          
        ;;

  "SkipHost")
   echo "What is the IP you want to test?: "
   read $ip
   sudo nmap -sS $ip  -p 102,502 -Pn
   break
          
        ;;
        
  "SpoofIP")
   echo "What is the IP you want to test?:"
   read $ip
   echo "What is the source address you want to spoof?: "
   read $ip2
   sudo nmap -sT $ip  -p 102,502 -Pn -S $ip2
   break
          
        ;;
        
  "ModbusDiscover")
   echo "What is the IP you want to test?: "
   read $ip
   sudo nmap $ip --script modbus-discover.nse
   break
          
        ;;
   ;;
        
  "s7-info")
   echo "What is the IP you want to test?: "
   read $ip
   sudo nmap $ip --script s7-info.nse
   break
          
        ;;


  "Check-IEC-60870-5-104")
   echo "What is the IP you want to test?: "
   read $ip
   sudo nmap $ip --script iec-identify.nse  
   break
          
        ;;
        
 "Aggressive")
   echo "What is the IP you want to test?: "
   read $ip
   sudo nmap -A $ip -p 102, 502, 802, 20000, 4059
   break
          
        ;;
        
 "Instructions")
   echo "This is a list of all the commands and their function:  "
   echo "SecretPing -sends raw ethernet TCP packets to see if host is up. This is helpful if there is a firewall or other detection system "
   echo "SkipHost       -this is a basic port scan that will skip host discovery, also may help in some firewall evasion "
   echo "SpoofIP        -this will do a port scan from a spoofed ip of your choice, choose within the same subnet as your target for better results "
   echo "ModbusDiscover - this will use the Modbus Discover nse script in nmap for better enumeration of the Modbus protocol  "
   echo "s7-info        - Checks for Sieman's S7 PLC devices"
   echo "Check-IEC-60870-5-104 - Checks IEC-60870-5-104 protocol using the specific nmap script for better enumeration "
   echo "Aggressive     -does an Aggressive scan on common Scada/ICS ports Warning: This scan is noisy and can trigger a firewall/NIDS/or IDS "
   echo "Instructions  - Gives details about the choices in this tool "
   echo "Research- Links notes,ideas,  and cool stuff I found important in this project. It is a constant work in progress "
   break
          
        ;;
        
 "Research")
   echo "This is a place where I put some notes and things I have found.  "
   echo "This includes schematics/datasheets for Programmable Logic Controllers etc."
   echo "modicon m221 guidelines: https://download.schneider-electric.com/files?p_enDocType=User+guide&p_File_Name=EIO0000004242.00.pdf&p_Doc_Ref=EIO0000004242"
   echo "Sieman's site for PLC secirty Data Sheets: https://support.industry.siemens.com/cs/document/90885010/security-with-simatic-s7-controller-?dti=0&pnid=14339&lc=en-WW"
   echo "Here are some tips to make this hack count: "
   echo "If you can get in check firewall rules, it can help retrieve MACs for secondary devices such as sensors etc. "
   echo "any findings with 502 or 102 run PLCSCAN"
   echo "some make them set it at first login, pay particular attention to company specifics,slogans, etc"
   echo "Check all data sheets of PLC for default creds, I have researched things such as Adminitrator/Administrator and Administrator/0000"
   echo "I already added some firewall evasion but you can add this to possibly evade firewalls firewall-bypass.nse"
   echo  "see if target is infected with stuxnet: stuxnet-detect.nse, probably not but interesting script"
   echo "See if Siemen's TIA portal can be compromised by CVE-2019-10915 https://github.com/tenable/poc/tree/master/Siemens/TIAPortal"
   echo "read the write-up https://medium.com/tenable-techblog/nuclear-meltdown-with-critical-ics-vulnerabilities-8af3a1a13e6a"
   break
          
        ;;

     *) "invalid option $Reply" ;;

esac

#ends case statement

done

#ends do statement

        
        
        
                
        
        


  
