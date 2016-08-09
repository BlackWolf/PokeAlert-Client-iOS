# PokeAlert-Client-iOS
iOS Client for the [PokeAlert Node Server](https://github.com/BlackWolf/PokeAlert-Server)

## What does it do?
This is a client application that send your current location to the [PokeAlert Node Server](https://github.com/BlackWolf/PokeAlert-Server), which in turn will connect to the pokemon servers, check for nearby pokemon and send you a push notification if there are any nearby. 

## Why is it cool?
You will receive push notifications about nearby Pokemon without running any app in the foreground, which saves battery and is convenient.

## How to install
1. Download the repo
2. Add the URL of the node.js server to `Config.m`
3. Put sprites of Pokemon (google them) into the pokemondata folder, named `1.png` to `151.png`
4. (Optional) Put sounds of Pokemon (google them) into the pokemondata folder, named `1.mp3` to `151.mp3`

## How to run
1. Start the node js server
2. Run the app on your device

That's it, you can now put the app in the background and will receive push notification about interesting pokemon

## Thanks
Thanks to the people that created  the [Pokemon Go Node API](https://github.com/Armax/Pokemon-GO-node-api) and everybody involved in cracking the API!
