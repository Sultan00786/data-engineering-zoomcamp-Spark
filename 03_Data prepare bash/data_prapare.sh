TAXI=$1
YEAR=$2
# "https://d37ci6vzurychx.cloudfront.net/trip-data/yellow_tripdata_2020-01.parquet"
PRE_FIX="https://d37ci6vzurychx.cloudfront.net/trip-data"


PRE_LOCAL_PATH="../data/raw/${TAXI}/${YEAR}"
mkdir -p "${PRE_LOCAL_PATH}"

for MONTH in {1..12};
do
     FORMAT_MONTH=`printf "%02d" ${MONTH}`
     FILE_NAME="${TAXI}_tripdata_${YEAR}-${FORMAT_MONTH}.parquet"

     URL="${PRE_FIX}/${FILE_NAME}"
     LOCAL_PATH="${PRE_LOCAL_PATH}/${FILE_NAME}"

     wget "${URL}" -O "${LOCAL_PATH}"
     gzip "${LOCAL_PATH}"
done
w
# show files in that dir
ls -lh "${PRE_LOCAL_PATH}"