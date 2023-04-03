rule = {
    matches = {
        {
            {"node.name", "equals", "alsa_input.pci-0000_08_00.6.analog-stereo"},
        },
    },

    apply_properties = {
        ["node.description"] = "System",
        ["node.nick"] = "System",
        ["priority.session"] = 2000,
    },
}

table.insert(alsa_monitor.rules, rule)
