function GetRandomFantasyName() {
    var names = [
        "Eldorinras", "Thalindras", "Morrigaras", "Caladwenras", "Vandoriras",
        "Lorthianras", "Seraphiras", "Thornirras", "Galadras", "Faldorinras",
        "Elyndras", "Grimnaras", "Eldarias", "Dunmiras", "Valorianras",
        "Taldoras", "Balduras", "Haldraras", "Mithrildras", "Eladrinras",
        "Rivendras", "Gorionras", "Caelras", "Vaeloras", "Thrandras",
        "Galdoriras", "Nymiras", "Fayelras", "Luthiras", "Thalorianras",
        "Kelendras", "Rhydenras", "Eldorianras", "Valindras", "Orindras",
        "Galadras", "Feydras", "Calindras", "Arindras", "Vaeliras",
        "Lyrindras", "Feyras", "Thaloras", "Vandras", "Caladirras",
        "Myrindras", "Elvaras", "Keldras", "Dorianras", "Rivenras",
        "Galdoras", "Therandras", "Aranras"
        // Add more names from your list here if needed
    ];

    // Get a random index from the names array
    var random_index = irandom(array_length(names) - 1);

    // Return the randomly selected name
    return names[random_index];
}