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
    External (_PR_.CPU0, DeviceObj)    // (from opcode)
    External (_PR_.PR00, DeviceObj)    // (from opcode)
    External (_SB_.CPU0, DeviceObj)    // (from opcode)
    External (_SB_.PR00, DeviceObj)    // (from opcode)
    External (_SB_.SCK0.CP00, DeviceObj)    // (from opcode)
    External (_SB_.SCK0.PR00, DeviceObj)    // (from opcode)

    If (CondRefOf (\_SB.CPU0))
    {
        Scope (\_SB.CPU0)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    If (CondRefOf (\_PR.CPU0))
    {
        Scope (\_PR.CPU0)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    If (CondRefOf (\_SB.PR00))
    {
        Scope (\_SB.PR00)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    If (CondRefOf (\_PR.PR00))
    {
        Scope (\_PR.PR00)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    If (CondRefOf (\_SB.SCK0.CP00))
    {
        Scope (\_SB.SCK0.CP00)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }

    If (CondRefOf (\_SB.SCK0.PR00))
    {
        Scope (\_SB.SCK0.PR00)
        {
            Method (_DSM, 4, NotSerialized)  // _DSM: Device-Specific Method
            {
                If (LEqual (Arg2, Zero))
                {
                    Return (Buffer (One)
                    {
                         0x03                                           
                    })
                }

                Return (Package (0x02)
                {
                    "plugin-type", 
                    One
                })
            }
        }
    }
}
