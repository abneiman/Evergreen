package OpenSRF::Application::Demo::MathDB;
use JSON;
use base qw/OpenSRF::Application/;
use OpenSRF::Application;
use OpenSRF::DomainObject::oilsResponse qw/:status/;
#use OpenSRF::DomainObject::oilsPrimitive;
use OpenSRF::Utils::Logger qw/:level/;
use strict;
use warnings;

sub DESTROY{}
our $log = 'OpenSRF::Utils::Logger';
sub initialize {}

__PACKAGE__->register_method( method => 'add_1', api_name => 'add' );
sub add_1 {
	my $self = shift;
	my $client = shift;
	my @args = @_;
	$log->debug("Adding @args", INTERNAL);
	$log->debug("AppRequest is $client", INTERNAL);
	my $n1 = shift; my $n2 = shift;
	$n1 =~ s/\s+//; $n2 =~ s/\s+//;
	my $a = $n1 + $n2;
	return JSON::number::new($a);

}

__PACKAGE__->register_method( method => 'sub_1', api_name => 'sub' );
sub sub_1 {
	my $self = shift;
	my $client = shift;
	my @args = @_;
	$log->debug("Subbing @args", INTERNAL);
	$log->debug("AppRequest is $client", INTERNAL);
	my $n1 = shift; my $n2 = shift;
	$n1 =~ s/\s+//; $n2 =~ s/\s+//;
	my $a = $n1 - $n2;
	return JSON::number::new($a);
}

__PACKAGE__->register_method( method => 'mult_1', api_name => 'mult' );
sub mult_1 {
	my $self = shift;
	my $client = shift;
	my @args = @_;
	$log->debug("Multiplying @args", INTERNAL);
	$log->debug("AppRequest is $client", INTERNAL);
	my $n1 = shift; my $n2 = shift;
	$n1 =~ s/\s+//; $n2 =~ s/\s+//;
	my $a = $n1 * $n2;
	return JSON::number::new($a);
}

__PACKAGE__->register_method( method => 'div_1', api_name => 'div' );
sub div_1 {
	my $self = shift;
	my $client = shift;
	my @args = @_;
	$log->debug("Dividing @args", INTERNAL);
	$log->debug("AppRequest is $client", INTERNAL);
	my $n1 = shift; my $n2 = shift;
	$n1 =~ s/\s+//; $n2 =~ s/\s+//;
	my $a = $n1 / $n2;
	return JSON::number::new($a);
}

1;
