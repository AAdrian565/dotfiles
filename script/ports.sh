for url in $(nmap -p- -sV --open eventradar-bezsel-agent.gaur-buri.ts.net -oG - | awk '/open/ && /http/ {print $2 ":" $1}'); do
  echo "===== Curling http://$url ====="
  curl -i "http://$url" --max-time 5
  echo
done
