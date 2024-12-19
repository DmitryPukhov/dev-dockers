echo "Initialize schema registry"

# Install curl to query registry rest
REGISTRY_URL="http://schema-registry:8081"
apt -y update
apt install -y curl


# Install schemas
cd /initial-schemas

for file in *.avsc
do
  schema_name=$(echo $file | cut -f1 -d '.') # Remove extension
  echo "Installing schema $schema_name from $file"
  subject_name="${schema_name}-value"
  echo " Uninstall old schemas to avoid errors when overwriting with new name"
  curl --silent -X DELETE $REGISTRY_URL/subjects/$subject_name
  curl --silent -X DELETE $REGISTRY_URL/subjects/$subject_name?permanent=true
  echo "Errors above are ok, means no previous schemas to delete"

  # Install
  echo "Install"
  set -e
  curl --silent -X POST -H "Content-Type: application/vnd.schemaregistry.v1+json" --data @$file $REGISTRY_URL/subjects/$subject_name/versions
done

cd $OLDPWD