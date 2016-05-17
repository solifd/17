/Failed/ { ++S[$(NF-3)]}  
END { 
    for (a in S) {  
        if(S[a] > allow) print "sshd:"a 
    } 
} 
