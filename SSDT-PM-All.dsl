/*
 * Unico SSDT dinamico per abilitare il power management su varie serie
 * Attualmente supporta e abilita il PM, indistintamente da Desktop o Laptop, su: 
 * - Haswell
 * - Skylake
 * - Skylake-R
 * - Kabylake
 * - Kabylake-R
 * - Coffelake
 * - Whiskeylake
 * - Icelake
 */

DefinitionBlock ("", "SSDT", 2, "PM-all", "Mac86it", 0x00000000)
{
    External (_SB_.CPU0, ProcessorObj)
    External (_PR_.CPU0, ProcessorObj)
    External (_PR_.CP00, ProcessorObj)
    External (_PR_.C000, ProcessorObj)
    External (_PR_.P000, ProcessorObj)
    External (_SB_.PR00, ProcessorObj)
    External (_PR_.PR00, ProcessorObj)
    External (_SB_.SCK0.CP00, ProcessorObj)
    External (_SB_.SCK0.PR00, ProcessorObj)

    Method (PMPM, 1, NotSerialized) {
       If ((Arg0 == Zero)) {
           Return (Buffer (One) { 0x03 })
       }

       Return (Package (0x02)
       {
           "plugin-type", 
           One
       })
    }

    If (CondRefOf (\_SB.CPU0)) {
        If ((ObjectType (\_SB.CPU0) == 0x0C)) {
            Scope (\_SB.CPU0) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }
    
    If (CondRefOf (\_PR.CPU0)) {
        If ((ObjectType (\_PR.CPU0) == 0x0C)) {
            Scope (\_PR.CPU0) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }

    If (CondRefOf (\_SB.PR00)) {
        If ((ObjectType (\_SB.PR00) == 0x0C)) {
            Scope (\_SB.PR00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }

    If (CondRefOf (\_PR.CP00)) {
        If ((ObjectType (\_PR.CP00) == 0x0C)) {
            Scope (\_PR.CP00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }

    If (CondRefOf (\_PR.C000)) {
        If ((ObjectType (\_PR.C000) == 0x0C)) {
            Scope (\_PR.C000) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }
    
   If (CondRefOf (\_PR.P000)) {
        If ((ObjectType (\_PR.P000) == 0x0C)) {
            Scope (\_PR.P000) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }
    
   If (CondRefOf (\_PR.PR00)) {
        If ((ObjectType (\_PR.PR00) == 0x0C)) {
            Scope (\_PR.PR00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }

   If (CondRefOf (\_SB.SCK0.CP00)) {
        If ((ObjectType (\_SB.SCK0.CP00) == 0x0C)) {
            Scope (\_SB.SCK0.CP00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }

   If (CondRefOf (\_SB.SCK0.PR00)) {
        If ((ObjectType (\_SB.SCK0.PR00) == 0x0C)) {
            Scope (\_SB.SCK0.PR00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg2))
                }
            }
        }
    }
}
