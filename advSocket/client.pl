use IO::Socket::INET;

$| = 1;
my($socket,$c_socket);

#create object of the interface of IO::Socket::INET
#Socket, binds and connects to the TCP server port

$socket = new IO::Socket::INET(PeerlHost =>'localhost', PeerPort => '3535', Proto => 'tcp') or die "error in socket creation : $!\n";

print "TCP connection success.\n";

#read data sent by the server
$data=<$socket>;
#also can read using IO::Socket::INET
#$socket-> recv($data,1024);
print "Received from server : $data\n";

#write
$data = "Data from client";
print $socket "data\n";
#if using IO::Socket::INET
#$socket->send($data);

sleep(10);
$socket->close();
