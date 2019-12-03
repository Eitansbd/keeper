# Paperclip::Attachment.default_options.update({
#     storage: :s3,
#     s3_protocol: 'https',
#     s3_host_name: 's3-us-east-2.amazonaws.com',
#     s3_credentials: {
#         s3_region: ENV.fetch('FISH_CATCH_S3_REGION'),
#         bucket: ENV.fetch('FISH_CATCH_BUCKET_NAME'),
#         access_key_id: ENV.fetch('FISH_CATCH_ACCESS_KEY_ID'),
#         secret_access_key: ENV.fetch('FISH_CATCH_SECRET_ACCESS_KEY')
#     }
# })