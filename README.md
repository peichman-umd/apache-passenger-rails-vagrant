# apache-passenger-rails-vagrant

Apache+Passenger Vagrant box for running Ruby on Rails applications

## Usage

Configure your Rails app's `Gemfile` to include the Passenger gem:

```ruby
gem "passenger", ">= 5.0.25", require: "phusion_passenger/rack_handler"
```

Then you can start the Vagrant and it will launch the app using Passenger:

```
$ RAILSAPP_DIR=/path/to/rails/app vagrant up
```

## Details

Base box: [peichman-umd/ruby (1.0.0)][1] with:

* CentOS 7.0 64-bit
* RVM 1.26.11
* Ruby 2.2.4
* Rails 4.2.6

Port 80 on the guest is forwarded to 8000 on the host.

The `RAILSAPP_DIR` on the host is mounted as `/apps/src` on the guest.

Installs the most recent version of [Phusion Passenger][2] (5.0.26 as of March
29, 2016). Configures Apache with mod_passenger to serve the Rails app found in
`/apps/src` on port 80.

### Reloading with a Different App

If you wish to change the Rails app that is loaded by Passenger, you can run the
following from the host:

```
$ RAILSAPP_DIR=/path/to/new/app vagrant reload
$ vagrant ssh -c /vagrant/scripts/railsapp.sh
```

The `railsapp.sh` ensures that the Apache virtual host is configured, and runs
`bundle install` in the `/apps/src` directory.

[1]: https://atlas.hashicorp.com/peichman-umd/boxes/ruby/versions/1.0.0
[2]: https://www.phusionpassenger.com/
