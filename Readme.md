# Ripe Atlas Software Probe Container

Run ripe atlas in docker container.

Create directory that stores ripe atlas ssh keys, then execute ripe atlas container.  
System will creates your private and public key.

```bash
atlas_etc="/mydata/config/ripe-atlas/"
mkdir -p $atlas_etc
docker run -itd --rm --name atlas-probe --privileged -v $atlas_etc:/var/atlas-probe/etc/ ghcr.io/ahmetozer/ripe-atlas-probe
```

You can find your public key under `${atlas_etc}/probe_key.pub`
