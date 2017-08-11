mkdir pregenerated

cd pregenerated

rails new demo_geoblacklight_app -m https://raw.githubusercontent.com/geoblacklight/geoblacklight/master/template.rb

mkdir ~/solr
cd ~/solr

echo "download_dir: ~/solr" >> ~/.solr_wrapper

curl -O https://archive.apache.org/dist/lucene/solr/6.6.0/solr-6.6.0.zip

cd ~/pregenerated/demo_geoblacklight_app

bundle install
