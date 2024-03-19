import { userModel } from "../models/user";

const getAddressData = async(): Promise<any> =>{
    let addresses: any = [];
    const users = await userModel.find();
    
    users.map((user) => {
        const userAddresses: any = [
            { user: user?.id, streetAddress: "House No. 123, Block A, Gulshan-e-Iqbal", city: "Karachi", state: "Sindh", zipCode: 12345 },
            { user: user?.id, streetAddress: "House No. 456, Street 12, Clifton", city: "Karachi", state: "Sindh", zipCode: 23456 },
            { user: user?.id, streetAddress: "House No. 789, Lane 5, Defence Phase 6", city: "Karachi", state: "Sindh", zipCode: 34567 },
            { user: user?.id, streetAddress: "House No. 234, Block B, North Nazimabad", city: "Karachi", state: "Sindh", zipCode: 45678 },
            { user: user?.id, streetAddress: "House No. 567, Lane 9, PECHS", city: "Karachi", state: "Sindh", zipCode: 56789 },
            { user: user?.id, streetAddress: "House No. 890, Street 3, Saddar", city: "Karachi", state: "Sindh", zipCode: 67890 },
            { user: user?.id, streetAddress: "House No. 321, Block C, Korangi", city: "Karachi", state: "Sindh", zipCode: 78901 },
            { user: user?.id, streetAddress: "House No. 654, Lane 15, Malir Cantt", city: "Karachi", state: "Sindh", zipCode: 89012 },
            { user: user?.id, streetAddress: "House No. 987, Block D, Gulistan-e-Jauhar", city: "Karachi", state: "Sindh", zipCode: 90123 },
            { user: user?.id, streetAddress: "House No. 210, Street 7, Nazimabad", city: "Karachi", state: "Sindh", zipCode: 11223 },
            { user: user?.id, streetAddress: "House No. 543, Block E, Shah Faisal Colony", city: "Karachi", state: "Sindh", zipCode: 22334 },
            { user: user?.id, streetAddress: "House No. 876, Street 21, Lyari", city: "Karachi", state: "Sindh", zipCode: 33445 },
            { user: user?.id, streetAddress: "House No. 109, Lane 4, Landhi", city: "Karachi", state: "Sindh", zipCode: 44556 },
            { user: user?.id, streetAddress: "House No. 432, Block F, Gulshan-e-Maymar", city: "Karachi", state: "Sindh", zipCode: 55667 },
            { user: user?.id, streetAddress: "House No. 765, Street 18, Surjani Town", city: "Karachi", state: "Sindh", zipCode: 66778 },
            { user: user?.id, streetAddress: "House No. 321, Lane 11, Gulshan-e-Hadeed", city: "Karachi", state: "Sindh", zipCode: 77889 },
            { user: user?.id, streetAddress: "House No. 654, Block G, Korangi Industrial Area", city: "Karachi", state: "Sindh", zipCode: 88990 }
        ];
        addresses.push(...userAddresses);
    });

    return addresses;
}

export { getAddressData }