package Address;
use Dancer ':syntax';

our $VERSION = '0.1';

my $flash;
sub set_flash { $flash = shift; }
sub get_flash { my $msg = $flash; $flash = ""; return $msg; }

get '/' => sub {
    my $city = [
        { id => 1, name => "Praha" },
        { id => 2, name => "Brno" },
        { id => 3, name => "Ostrava" },
    ];
    my $street = [
        { id => 1, name => "Kotkova" },
        { id => 2, name => "Trnita" },
        { id => 3, name => "Videnska" },
    ];
    template 'address', {
        'msg' => get_flash(),
        'cities' => $city,
        'streets' => $street,
    };
};

get '/zipcode/:psc' => sub {
    #template 'address' => { zipcode => param('psc') };
    set_flash("PSC vlozeno");
    redirect('/');
};

true;
