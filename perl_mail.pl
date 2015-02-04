#!/usr/bin/perl
print "What is your name?: ";
my $name = <STDIN>;
chomp $name; 
exit 0 if ($name eq ""); 

use Time::Localtime; ($sec,$min,$hour,$mday,$mon,$year,$wday,$yday,$isdst) = localtime(time);
	if($hour>=0 && $hour<=12){ $greeting = "Good morning!";}
		elsif($hour>=12 && $hour<=18){$greeting = "Good Afternoon!";}
			else {$greeting = "Good Evening!";}

print "$greeting $name! Would you like to send an email? (yY/nN)";

$decision=<STDIN>;
chomp $decision;

if(uc($decision) eq "Y"){
	
	print("What is your email?");
		$from = <STDIN>;
		chomp $from;
	
	print("Which email are you sending to?");
		$to = <STDIN>;
		chomp $to;
		
	print("What is your subject line?");	
		$subject = <STDIN>;
		chomp $subject;
	
	print("Write your message here: ");
	$message = <STDIN>;
 
open(MAIL, "|/usr/sbin/sendmail -t");
 
# Email Header
print MAIL "To: $to\n";
print MAIL "From: $from\n";
print MAIL "Subject: $subject\n\n";
# Email Body
print MAIL $message;

close(MAIL);
print "Email Sent Successfully\n";
}
else{
	print "See you next time.";
}
