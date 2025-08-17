# Lab Star

An interactive arcade cabinet and game exploring the intersection of art, science, and technology through the lens of laboratory rat research and maze navigation.

## Project Overview

**Lab Star** is an interactive arcade cabinet (10' x 34" x 38") created in 2012 that combines art, research, and gaming to explore the ethical implications of laboratory animal research and the commodification of living beings in scientific contexts.

### Concept & Inspiration

The project emerged from research into the history of laboratory rat behavior studies, specifically Willard Stanton Small's early 20th-century experiments using the Hampton Court Maze to measure learning in rats. The artist conducted their own maze trials with two female rats (Tyra and Rati), which led to ethical conflicts with traditional laboratory protocols and the adoption of "pseudoscience" as an ethical framework for exploration.

### Artistic Statement

Lab Star examines the ongoing scientific narrative that contextualizes rats as commodities (lab materials) and explores how this form of appropriation can be used for art-making. The work functions as research, experiment, exploration, and hacking—testing boundaries while maintaining a playful approach that ultimately reflects on the species' role in technoscience.

## Technical Specifications

### Hardware
- **Arcade Cabinet**: 10' x 34" x 38" custom-built enclosure
- **Control Panel**:
  - Vintage rotary phone dial
  - Traditional arcade joystick
  - Trackball
- **Display**: Monitor with minimal, clinical interface design
- **Arduino Integration**: LabStarArduino005 for hardware control

### Software
- **Game Engine**: Processing (version 1.5.1)
- **Game Type**: 3D first-person maze navigation
- **Environment**: Hampton Court Maze recreation
- **Player System**: Persistent ID tracking with gameplay statistics

## Game Features

### Player Management
- First-time players create unique Player IDs
- Returning players can enter existing IDs
- Comprehensive tracking of:
  - Player attributes
  - Gameplay sessions
  - Session duration
  - Usage patterns

### Gameplay
- **Perspective**: First-person 3D navigation
- **Environment**: 3D model of the Hampton Court Maze
- **Interface**: Minimal, clinical aesthetic inspired by psychology research interfaces
- **Controls**: Intuitive arcade-style input system

## Installation & Setup

### Prerequisites
- Processing IDE (version 1.5.1 recommended for compatibility)
- Arduino IDE (for hardware integration)
- Required libraries (see Libraries section)

### Setup Instructions
1. Clone this repository
2. Open the Processing sketch in `_LabStarGame_FINALxxxKILL/`
3. Install required Processing libraries
4. Upload Arduino code to your hardware
5. Connect hardware components
6. Run the Processing sketch

### Libraries
The project requires several Processing libraries:
- `controlP5` - User interface controls
- `fullscreen` - Fullscreen display functionality
- `mesh` - 3D mesh handling
- `physics` - Physics simulation
- Additional libraries in the `libraries/` directory

## Project Structure

```
LabStar/
├── _LabStarGame_FINALxxxKILL/     # Main Processing game files
├── LabStarArduino005/             # Arduino hardware control code
├── libraries/                     # Required Processing libraries
└── README.md                     # This file
```

## Media & Documentation

- **Video Documentation**: [Lab Star on Vimeo](https://player.vimeo.com/video/51833380)
- **Artist Website**: [jessicaann.info](http://jessicaann.info)
- **Project Context**: [Lab Star Project Page](http://jessicaann.xyz/lab-star/)

## Artist Statement

> "I am interested in the ongoing science narrative that contextualizes rats as commodities (lab materials), and how this form of appropriation may be used for art making. Lab Star is part research, experiment, exploration, and hacking: I wanted to test boundaries and above all: play. In the end, the work made with Tyra and Rati points back to their species' role in technoscience."

## Technical Notes

- **Processing Version**: 1.5.1 (for compatibility)
- **Interface Design**: Minimal, clinical aesthetic inspired by psychology research interfaces
- **Hardware Integration**: Custom Arduino code for arcade controls
- **Data Persistence**: Player ID and gameplay statistics tracking

## Contributing

This is an artistic research project. For questions about the project or technical implementation, please refer to the artist's website or contact information provided in the project documentation.

## License

This project is part of an artistic research portfolio. Please respect the intellectual property and artistic vision of the original creator.

---

**Lab Star** - An exploration of art, science, and the ethics of laboratory research through interactive gaming and kinetic sculpture.
