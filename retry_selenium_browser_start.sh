function retry {
   nTrys=0
   maxTrys=5
   status=256
   until [ $status == 0 ] ; do
      $1
      status=$?
      nTrys=$(($nTrys + 1))
      if [ $nTrys -gt $maxTrys ] ; then
            echo "Number of re-trys exceeded. Exit code: $status"
            exit $status
      fi
      if [ $status != 0 ] ; then
            echo "Failed (exit code $status)... retry $nTrys"
            sleep 300
      fi
   done
}

retry "sh -e /etc/init.d/xvfb start"