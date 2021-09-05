#!/bin/sh

#auto-remover-kde.sh
#By Rocco Ronzano

figlet Auto-remover-kde

secondes=15
function timer {
    while [[ "$secondes" != 0 ]]
    do
        secondes--
    done

}

while [[ "$choix" != "Non" ]]
do
    echo "Voulez-vous vraiment supprimer KDE ?"
    select choix in Oui Non
    do
        case $choix in
            Oui )
                echo ""
                echo "OK"
                echo ""
                sudo apt remove kubuntu-desktop plasma-desktop kde* plasma* --autoremove
                sudo update-alternatives --config default.plymouth
                sudo update-initramfs -u
                sudo update-grub
                systemctl stop sddm
                sudo systemctl enable gdm3
                sudo systemctl start gdm3
                timer
                echo "le système va redémarrer dans $secondes secondes..."
                sudo reboot now
                break;;
            Non )
                echo "D'accord, à une prochaine !"
                break;;
            * )
                echo ""
                echo "Valeur inconnue"
                echo "";;
        esac
    done
done

#end of script