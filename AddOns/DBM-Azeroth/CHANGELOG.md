# <DBM Mod> Azeroth (Classic)

## [1.15.5](https://github.com/DeadlyBossMods/DBM-Classic/tree/1.15.5) (2023-12-12)
[Full Changelog](https://github.com/DeadlyBossMods/DBM-Classic/compare/1.15.4...1.15.5) [Previous Releases](https://github.com/DeadlyBossMods/DBM-Classic/releases)

- Prep classic version for tag  
- bump alpha  
- prep new retail tag  
- Update commonlocal.cn.lua (#333)  
- Update koKR (#331)  
- Fix some of the bigger problems for LuaLS. (#332) This unlocks amazing LuaLS features like auto-complete and jump-to-definition for all fields in DBM, mods, timers, warnings etc :)  The main problem was that the DBM the DBM global was registered in a way it didn't understand (and hence it only saw about half the fields). Also, we had some cases of functions being tagged as optional for no good reason triggering a lot of nil check warnings.  It currently still reports around 600 problems or so, but a lot of these are just it being unhappy about us setting random fields in Frame objects which I guess we should disable.  
- Re-enable item checks on hostile creatures in boss distance check code  
- Add support for loading mods by MapID (#330)  
- Fix ismythic check with recent change  
- Allow anyone to set icons specifically in dungeons, instead of just party leader. This should solve many cases where no icons are set because person who was leader had no boss mod installed. Should make things like auto marking trio in waycrest more reliable  
- Fix one failure condition for final scan not running and causing fallback filter target to work, is if by the time scan finished, bosses target went invalid, thus causing final scan to never schedule.  
- hard wipe GUID period even if not elected icon setter (even though by code logic, if not elected, it would never get set in first place)  
- Update localization.es.lua (#327)  
- Update localization.tw.lua (#329)  
- Temporarily revert last. It's far too spammy at present.  
- Core: WBA: add SoD Boon of Blackfathom (#328)  
- Update localization.es.lua (#39)  
- Update localization.mx.lua (#38)  
- bump classic alpha  
