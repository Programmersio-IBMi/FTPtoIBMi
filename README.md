# FTPtoIBMi
batch ftp to ibmi from windows 

The repository has two bat files upload.bat for upload process and download.bat

### Instruction to use 

* git clone https://github.com/Programmersio-IBMi/FTPtoIBMi.git or download zip and expand
* Copy upload.bat/download.bat to the directory where you have your files or want to keep. 
* Open powershell or cmd prompt in windows with 
* For upload.bat 
   - In shell window navigate to your files path. 
   - cd path/to/file 
   - **You need to have the upload.bat file in your directory as said above**
   - Run the command ` .\upload.bat ibmi_ip_address myuser mypassword saveFileName.savf `
     - .\upload.bat opens the file in shell for execution 
     - rest all are parameters passed to this file, separated by single spaces. 
     - The process creates a library as mentioned in the file and uploads to that library
   - Your SAVF must be uploaded in the system provided. 
* For download.bat 
   - In shell window navigate to your files path. 
   - cd path/to/file 
   - **You need to have the download.bat file in your directory as said above.** 
   - Run the command ` .\download.bat ibmi_ip_address myuser mypassword library saveFileName.savf `
     - .\download.bat opens the file in shell for execution 
     - rest all are parameters passed to this file, separated by single spaces. 
   - Your SAVF must have been downloaded to the current directory.  

***If you want to change the library you want to upload to then open upload.bat and on line 11 chnage restore to your library name***

> VPN must be connected 

### General explanation of the code using upload.bat file
* line 1-5 are comments 
* line 6-11 are variables and 7-10 are passed as parameters to the file with sequence number mentioned. 
* line 12-14, checks if parmeters passed or not 
* line 15-25 writes all the command in the temporary file restore.fts 
* line 26 executes the temporary file, this is similar to using flat file in ibmi to ibmi batch ftp process.
* line 27 delete temporary file. 
* line 28 end the program 
* line 31-35 error handling. 



