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
    External (_PR_.CPU0, Processorobj)    // (from opcode)
    External (_PR_.PR00, Processorobj)    // (from opcode)
    External (_SB_.CPU0, Processorobj)    // (from opcode)
    External (_SB_.PR00, Processorobj)    // (from opcode)
    External (_SB_.SCK0.CP00, Processorobj)    // (from opcode)
    External (_SB_.SCK0.PR00, Processorobjj)    // (from opcode)

    Method (PMPM, 4, NotSerialized) {
       If (LEqual (Arg2, Zero)) {
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
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_PR.CPU0)) {
        If ((ObjectType (\_PR.CPU0) == 0x0C)) {
            Scope (\_PR.CPU0) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_SB.PR00)) {
        If ((ObjectType (\_SB.PR00) == 0x0C)) {
            Scope (\_SB.PR00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }
        
    If (CondRefOf (\_PR.PR00)) {
        If ((ObjectType (\_PR.PR00) == 0x0C)) {
            Scope (\_PR.PR00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_SB.SCK0.CP00)) {
        If ((ObjectType (\_SB.SCK0.CP00) == 0x0C)) {
            Scope (\_SB.SCK0.CP00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }

    If (CondRefOf (\_SB.SCK0.PR00)) {
        If ((ObjectType (\_SB.SCK0.PR00) == 0x0C)) {
            Scope (\_SB.SCK0.PR00) {
                Method (_DSM, 4, NotSerialized)  
                {
                    Return (PMPM (Arg0, Arg1, Arg2, Arg3))
                }
            }
        }
    }
}
