#!/usr/bin/env perl -w

use Net::SMTP;

$smtp = Net::SMTP->new("aspmx.l.google.com",
                        Hello => 'mx1.validemail.com',
                        Timeout => 60);

my $filename = $ARGV[0];
my $results = $ARGV[1];
open my $fd, '<', $filename or die $!; # open the file using lexically scoped filehandle
while( my $email = <$fd>) {
	print "\n[*] Checking: ", $email, "\n";
	$smtp->mail(''); # MAIL FROM:
	$smtp->recipient($email); # RCPT TO:
	print "Code returned is: ", $smtp->code(), "\n";
	open my $out_fd, '>>', $results or die $!; # create/open file for writing
	if( $smtp->code() == '250' ) {
		# valid email
		print "Email is valid\n";
		#open my $out_fd, '>>', $results or die $!; # create/open file for writing
		print $out_fd $email; # write email to file
	} elsif( $smtp->code() == '550' ) {
		# email is invalid
		print "Email is not valid\n";
	} else {
		# something else happened
		print "SMTP code is ", $smtp->code, "\n";
	}
	if( eof($fd) ) {
		print "End of file\n";
		close $out_fd;
	} else {
		print "Sleeping\n";
		sleep(5);
	}	
}

close $fd;
