#include <iostream>
#include <cassert>
#include <vector>

using namespace std;

struct person {
    int id;
    vector<int> preferences;
    bool taken;
    int partner;
};

bool comparingTwoPotentialPartners ( vector<person> list, int woman, int potentialPartner, int currentPartner ) {

    int size = list.size()/2;

    for ( int i = 0; i < size; i++ ) {
        // Current partner is better
        if ( list[woman].preferences[i] == currentPartner ) {
            return true;
        }
        // New partner is better
        if ( list[woman].preferences[i] == potentialPartner ) {
            return false;
        }
    }
    return true;
}

void stableMarriage( vector<person> list ) {

    int size = list.size();
    int marriedCounter = 0;

    while ( marriedCounter < size/2 ) {
        
        int man;
        for (man = 1; man <= size/2; man++) {
            if (list[man].taken == false) {
                break;
            }
        }

        for ( int i  = 0; (i <= size/2) && (list[man].taken == false) ; i++) {

            // selecting woman
            int woman = list[man].preferences[i];

            
            // Comparing current partner (curr) with potential partner (man)
            if ( list[woman].taken ) {
                int curr = list[woman].partner;

                if ( ! comparingTwoPotentialPartners( list, woman, man, curr ) ) {
                    list[woman].partner = man;
                    list[woman].taken = true;

                    list[man].partner = woman;
                    list[man].taken = true;

                    list[curr].partner = -1;
                    list[curr].taken = false;
                }
            }
            // Making new partners if woman is free
            else {

                list[man].partner = woman;
                list[man].taken = true;

                list[woman].partner = man;
                list[woman].taken = true;

                marriedCounter++;
            }
        }

    }

    // Output printing
    for ( int i = 1; i < size; i++ ) {
        cout << list[i].partner << endl;
    }
} 

int main ( void ) {

    int men, women,
        tmp;
    
    vector<person> list;

    //cout << "Input scanning!" << endl;
    cin >> men >> women;
    
    person imaginary;
    list.push_back(imaginary);

    for ( int i = 1; i <= 2*men; i++ ) {
        cin >> tmp;
        person human;
        human.id = i;
        human.taken = false;
        human.partner = -1;
        for ( int k = 0; k < men; ++k ) {
            cin >> tmp;
            human.preferences.push_back(tmp);
        }
        list.push_back(human);
    }
    stableMarriage( list );
    return 0;
}