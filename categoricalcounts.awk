BEGIN {
    FS = ","
    total = 0
}

NR > 1 {
    hectare = $4  # Column 4 contains the Hectare
    behavior = $9  # Column 9 contains the PrimaryFurColor, can be replaced with another column
    if (behavior == "") {
        behavior = "Other"
    }
    key = hectare ":" behavior
    count[key]++
    total++
}

END {
    for (key in count) {
        percentage = (count[key] / total) * 100
        rounded_percentage = sprintf("%.1f", percentage)
        print key, count[key], rounded_percentage "%"
    }
}
