func getBotResponse(message: String) -> String {
    let tempMessage = message.lowercased()
    
    if tempMessage.contains("hello") || tempMessage.contains("hi") {
        return "Hey there!"
    } else if tempMessage.contains("goodbye") || tempMessage.contains("bye") {
        return "Talk to you later!"
    } else if tempMessage.contains("how are you") {
        return "I'm fine, thank you! How about you?"
    } else {
        return "That's cool!"
    }
}
