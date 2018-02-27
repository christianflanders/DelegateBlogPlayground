//: ### The Delegate Pattern
/*:
 The delegate pattern is used everywhere in Apple's own frameworks, so it is an important concept to understand. If you've done any iOS development, you've likely used a delegate pattern in something like UITableViewDelegate or something similar, even if you didn't understand what was going on under the hood.
 Delegates are a one to one communication pattern. This means that one object (class or struct) can send a message to another object. This message could be a value, such as a string or an Int, or it could just be a message to say "hey, do this now".
 The "glue" between our two objects that allows them to communicate is a protocol. The protocol creates a shared language for our objects to speak to each other. If you're unfamiliar with protocols, you can read more about them HERE. In summary, protocols are just a blueprint of methods, properties, or other requirements that any class that conforms to that protocol must implement.
 Let's talk through what our goal is here. First, we're going to create a car object. Every good programming tutorial uses cars as an example, and we want to be good, so we are too.
 Then, we'll create a person, called Janet, who will own the car. But Janet isn't always around the car when she needs to start it, so she bought a remote starter for her car. The remote starter will be our protocol. Janet can use the remote starter to send a message to her car.
 So let's start by creating our delegate protocol. This is our shared language between Janet and her car. Basically, all we're doing here is saying "Hey computer. I'm going to create a protocol called RemoteStarterDelegate. Anything that implements this protocol will HAVE to contain the method "startCar".
 */
import UIKit

protocol RemoteStarterDelegate {
    func startCar()
}
/*:
 Next, we're going to create the blueprint for our person who will eventually become Janet

 */
struct Person {
    let name: String
    var remoteStarterDelegate: RemoteStarterDelegate?

    func pressRemoteStarter() {
        remoteStarterDelegate?.startCar()
    }
    init(name: String) {
        self.name = name
    }
}

/*:
 Simple enough, right? In Swift, protocols are first-class citizens, like strings or doubles or arrays. Just think of line 21 the same as line 20. In line 20, we are giving Janet a property called name, that will be of type string. The next line is exactly the same. Person also has a property called remoteStarterDelegate, that we are telling swift will be of type RemoteStarterDelegate. We can create whatever class we want, as long as it follows the RemoteStarterDelegate protocol, our person can keep track of it. We could create a car, a motorcycle, and a rocketship class that all follow our delegate protocol, and our person could hook their remote starter up to any of them. It's also important to note that we are setting this value as an optional. That's because we might create our person, and then a few minutes later create our car, or we might never create our car, so there is nothing to fill this slot with.
 */

struct Car: RemoteStarterDelegate {
    func startCar() {
        print("vroom vroom")
    }
}

/*:
Now we've created our car, which conforms to the delegate we created above. This allows our person to know about the car and send messages to it. However, our person has no idea what happens when they press the button on their remote starter. It might start the car, it might turn on the stereo, or it might deflate the tires. While this might be confusing in our kind of convoluted example at this point, it is important to keep our concerns separate. All our person needs to know is that if they press the button, the car does something. It's up to the car to provide the functionality.

 */
var janet = Person(name: "Janet")
let janetsCar = Car()
janet.remoteStarterDelegate = janetsCar

/*:
 Pretty simple, right? Now we have a person called Janet, and Janet's car. Janet knows that if she presses her button, her car will do something. So, let's press the button finally.
 */

//janet.pressRemoteStarter()


