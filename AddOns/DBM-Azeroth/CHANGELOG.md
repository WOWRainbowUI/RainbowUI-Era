# <DBM Mod> Azeroth (Vanilla)

## [1.15.18](https://github.com/DeadlyBossMods/DBM-Classic/tree/1.15.18) (2024-02-22)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Classic/compare/1.15.17...1.15.18) [Previous Releases](https://github.com/DeadlyBossMods/DBM-Classic/releases)

- Bump versions again and make it a mandatory (force disable) triggering update do to how important bug fix is since the function that was broken is used A LOT by a lot of mods and core functions, especially affecting wrath classic but also retail and classic era in certain situations custom \"boss unit Id only\" checks were used. Long short of it. In this weeks updates, a function was rewritten to be better but had a bug in it that broke the rewrite in specific circomstances that were missed in testing because I didn't do the testing on wrath classic (the only client that has yet to recieve UnitTokenFromGUID from blizzard.  
- Reapply \"Fix target scanning so it only filters the active tank and not ALL of them. was already fixing this when https://github.com/DeadlyBossMods/DBM-Unified/pull/432 came through but this supercedes it cause it fixes it in more spots\" This reverts commit 13acf4231f1616075fc57f11beba18d7187c62ee.  
- Fix major regression to DBM:GetUnitIdFromGUID that caused not only target scanning to break but a lot of other things too, but mostly in wrath classic specifically since UnitTokenFromGUID has not yet been synced there (retail and classic era have the blizzard function so they tend to prioritize it. This should correct the issues players noticed with target scanning and setting icons  
- bump alphas  
