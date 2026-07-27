# Show Listening Ports and the Associated Process Name
   netstat -bano | Select-String -Pattern LISTENING -Context 0,1