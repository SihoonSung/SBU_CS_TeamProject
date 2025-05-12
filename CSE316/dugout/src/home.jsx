function Home() {
    return (
        <div className="text">
            <ul>
                <li>Facility Reservation
                    <ul>
                        <li>
                            Facility List
                            <ol>
                                <li>Reservation Date should be the date after today.</li>
                                <li>The number of users should be between the maximum number of people and the minimum number of people.</li>
                                <li>If the facilicy is available only for SUNY Korea, user should be in SUNY Korea.</li>
                                <li>The reservation date must be made on the available day of the week.</li>
                                <li>The same person cannot book another facility on the same date.</li>
                                If all conditions are met, data is stored in local storage.
                            </ol>
                        </li>
                        <li>
                            User Information
                            <ol>
                                <li>user profile, user email, user password, user name</li>
                                <li>All other details can be modified except for the user email.</li>
                                <li>If the user profile is changed, the image in the navbar will also change.</li>
                            </ol>
                        </li>
                        <li>
                            Reservation History
                            <p>Load the reservation data stored in the local storage.</p>
                            <p>reservation id, facility name, purpose, peopleNum, isSUNY, booker name, date</p>
                            <p>Can cancel reservation</p>
                        </li>
                    </ul>
                </li>
            </ul>
        </div>
    );
}
export default Home;