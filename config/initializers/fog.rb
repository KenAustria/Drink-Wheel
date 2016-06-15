CarrierWave.configure do |config|
config.fog_credentials = {
:provider => 'AWS', # required
:aws_access_key_id => 'AKIAJDPA26ILKT4K774A', # required
:aws_secret_access_key => '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', # required
}
config.fog_directory = 'drink-wheel' # required
end







