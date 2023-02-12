//
//  File.swift
//  SimpleAudioPlayer
//
//  Created by Shirin on 2/11/23.
//

import Foundation

class SongData {
    static let shared = SongData()
    
    let data = [
        BookModel(id: 1,
                  imageName: "letopis",
                  title: "Peterburjskaya letopis",
                  author: "Dostoyevskiy",
                  description: "Lorem ipsum dolor sit amet consectetur adipiscing elit rhoncus, scelerisque enim mi tellus curae nunc nulla, dui ornare auctor risus fames ligula est. Augue magna lacinia convallis ultricies pharetra non penatibus, torquent varius dictumst fermentum montes habitasse ornare primis, eros ridiculus suspendisse potenti hendrerit molestie. Curae lectus nulla cursus taciti sociosqu sapien dui morbi, facilisis nisl neque eget egestas phasellus rutrum tempus fusce, ultricies hendrerit bibendum condimentum dictumst erat cras. \nRisus proin pharetra faucibus semper aptent magna sollicitudin dui imperdiet aenean arcu venenatis etiam tristique, rutrum rhoncus conubia hendrerit cum nullam et auctor vulputate dictum cras nunc. Malesuada nostra facilisi primis ridiculus et praesent nam lobortis scelerisque lacinia himenaeos condimentum diam penatibus turpis, iaculis tellus class nullam potenti aptent ultricies interdum hendrerit venenatis natoque neque feugiat. Nam nunc condimentum lectus vel montes neque hendrerit purus, et vehicula odio tempor facilisi lacus nascetur, rhoncus elementum habitasse natoque sollicitudin cras tristique.",
                  filename: "Letopis",
                  isLiked: AccountUserDefaults.liked.contains(1)),
        BookModel(id: 2,
                  imageName: "hadji-murat",
                  title: "Hadji murat",
                  author: "Lev Tolstoy",
                  description: "Lorem ipsum dolor sit amet consectetur adipiscing elit rhoncus, scelerisque enim mi tellus curae nunc nulla, dui ornare auctor risus fames ligula est. Augue magna lacinia convallis ultricies pharetra non penatibus, torquent varius dictumst fermentum montes habitasse ornare primis, eros ridiculus suspendisse potenti hendrerit molestie. Curae lectus nulla cursus taciti sociosqu sapien dui morbi, facilisis nisl neque eget egestas phasellus rutrum tempus fusce, ultricies hendrerit bibendum condimentum dictumst erat cras. \nRisus proin pharetra faucibus semper aptent magna sollicitudin dui imperdiet aenean arcu venenatis etiam tristique, rutrum rhoncus conubia hendrerit cum nullam et auctor vulputate dictum cras nunc. Malesuada nostra facilisi primis ridiculus et praesent nam lobortis scelerisque lacinia himenaeos condimentum diam penatibus turpis, iaculis tellus class nullam potenti aptent ultricies interdum hendrerit venenatis natoque neque feugiat. Nam nunc condimentum lectus vel montes neque hendrerit purus, et vehicula odio tempor facilisi lacus nascetur, rhoncus elementum habitasse natoque sollicitudin cras tristique.",
                  filename: "Hadji-murat",
                  isLiked: AccountUserDefaults.liked.contains(2)),
        BookModel(id: 3,
                  imageName: "boris-godunov",
                  title: "Boris Godunov",
                  author: "Aleksandr Pushkin",
                  description: "Lorem ipsum dolor sit amet consectetur adipiscing elit rhoncus, scelerisque enim mi tellus curae nunc nulla, dui ornare auctor risus fames ligula est. Augue magna lacinia convallis ultricies pharetra non penatibus, torquent varius dictumst fermentum montes habitasse ornare primis, eros ridiculus suspendisse potenti hendrerit molestie. Curae lectus nulla cursus taciti sociosqu sapien dui morbi, facilisis nisl neque eget egestas phasellus rutrum tempus fusce, ultricies hendrerit bibendum condimentum dictumst erat cras. \nRisus proin pharetra faucibus semper aptent magna sollicitudin dui imperdiet aenean arcu venenatis etiam tristique, rutrum rhoncus conubia hendrerit cum nullam et auctor vulputate dictum cras nunc. Malesuada nostra facilisi primis ridiculus et praesent nam lobortis scelerisque lacinia himenaeos condimentum diam penatibus turpis, iaculis tellus class nullam potenti aptent ultricies interdum hendrerit venenatis natoque neque feugiat. Nam nunc condimentum lectus vel montes neque hendrerit purus, et vehicula odio tempor facilisi lacus nascetur, rhoncus elementum habitasse natoque sollicitudin cras tristique.",
                  filename: "BorisGodunov",
                  isLiked: AccountUserDefaults.liked.contains(3)),
        BookModel(id: 4,
                  imageName: "otsy-i-deti",
                  title: "Otsy i deti",
                  author: "Ivan Turgenev",
                  description: "Lorem ipsum dolor sit amet consectetur adipiscing elit rhoncus, scelerisque enim mi tellus curae nunc nulla, dui ornare auctor risus fames ligula est. Augue magna lacinia convallis ultricies pharetra non penatibus, torquent varius dictumst fermentum montes habitasse ornare primis, eros ridiculus suspendisse potenti hendrerit molestie. Curae lectus nulla cursus taciti sociosqu sapien dui morbi, facilisis nisl neque eget egestas phasellus rutrum tempus fusce, ultricies hendrerit bibendum condimentum dictumst erat cras. \nRisus proin pharetra faucibus semper aptent magna sollicitudin dui imperdiet aenean arcu venenatis etiam tristique, rutrum rhoncus conubia hendrerit cum nullam et auctor vulputate dictum cras nunc. Malesuada nostra facilisi primis ridiculus et praesent nam lobortis scelerisque lacinia himenaeos condimentum diam penatibus turpis, iaculis tellus class nullam potenti aptent ultricies interdum hendrerit venenatis natoque neque feugiat. Nam nunc condimentum lectus vel montes neque hendrerit purus, et vehicula odio tempor facilisi lacus nascetur, rhoncus elementum habitasse natoque sollicitudin cras tristique.",
                  filename: "Otsy-i-deti",
                  isLiked: AccountUserDefaults.liked.contains(4)),
    ]
}
