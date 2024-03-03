# <DBM Mod> PvP

## [r169](https://github.com/DeadlyBossMods/DBM-PvP/tree/r169) (2024-02-27)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-PvP/compare/r168...r169) [Previous Releases](https://github.com/DeadlyBossMods/DBM-PvP/releases)

- Blood moon and Ashenvale: fix handling time zones for start time  
    Turns out GetServerTime() does not return server time but local time. Which  
    is fine because synchronized clocks are a thing. But we need to adjust for  
    server time zone.  
    The previous logic just relying on GetGameTime() got this right, but it was  
    unreliable because GetGameTime() sucks in other ways.  
