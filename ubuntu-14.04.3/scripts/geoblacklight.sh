mkdir pregenerated

cd pregenerated

rails new demo_geoblacklight_app -m https://raw.githubusercontent.com/geoblacklight/geoblacklight/master/template.rb --skip-spring

cd demo_geoblacklight_app

bundle exec rake jetty:download

bundle exec rake jetty:unzip

bundle exec rake geoblacklight:configure_jetty
