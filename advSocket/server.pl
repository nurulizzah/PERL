use IO::Socket::INET;
use IO::Select;

$|=1;

my($socket,$c_socket);
my($peeraddress,$peerport);

#creating the object interface of IO::Socket::INET
#create a socket, binds and listen to a specified port address
$socket = new IO::Socket::INET( LocalHost => 'localhost', LocalPort =>'3535', Proto > 'tcp', listen => 5, Reuse => 1) or die "Error in socket creation: $!\n";
$select = IO::Select->new($socket) or die "IO::Select $!";

print "Server waiting for client connection on port 3535";

@ready_c= $select->can_read(0);
foreach my $fh (@ready_c){
print $fh "";
if($fh == $socket){
my $new = $socket->accept();
$select-> add(new);
}
}

@ready_c= $select-> can_read(0);
foreach my $fh(@ready_c){
if($fh != $socket){
chomp($data=<$socket>);
print $data, "\n";
}
}

while(1)
{
#waiting for new client connection.
$c_socket = $socket->accept();

#get the host and number port of the client
$peer_address = $c_socket->peerhost();
$peer_port = $c_socket->peerport();

print "Accepted new client connection from: $peeraddress, $peerport\n";

#write
$data = "Data from server";
print $c_socket "$data\n";
#also can send data through IO::Socket::INET 
#$c_socket->send($data);

#read
$data = <$c_socket>;
#also can read using IO::Socket::INET using recv()
#$c_socket->recv($data, 1024);
print "Received from client : $data\n";

}

$socket->close();

#using SIGUPE to reove of descriptor from the select list

$SIG{PIPE}=sub
{
print "Receied SIGPIPE, removing a client ...\n";
unless (defined $current_client){
"No clients to remove\n";
}
else{
$Select->remove($current_client);
$current_client->close;
}
print "Total connected clients =>".(($Select->count)-1)."\n";
}
###
