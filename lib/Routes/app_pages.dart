
import 'package:get/get_navigation/src/routes/get_route.dart';

import 'package:mobility_planning_version4/Routes/app_routes.dart';
import 'package:mobility_planning_version4/Screens/Account_Activation/activation_binding.dart';
import 'package:mobility_planning_version4/Screens/Account_Activation/activation_screen.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/DepartureList/departurelist_binding.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/DepartureList/departurelist_screen.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/SeatView/seateview_screen.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/SeatView/seatview_binding.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/TicketSearch/ticket_bonding.dart';
import 'package:mobility_planning_version4/Screens/Bus%20Dashboard/TicketSearch/ticket_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Booking_history/booking_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Booking_history/booking_ctrl.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Booking_history/booking_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RequestForm/request_form_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/ReservationWaitingPage/waiting_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/ReservationWaitingPage/wating_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RideDetails/ride_detail_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/RideDetails/ride_details_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Ride_tracking/tracking_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Ride_tracking/tracking_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Welcome/welcome_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/Welcome/welcome_screen.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/client_profile/Client_profile_binding.dart';
import 'package:mobility_planning_version4/Screens/Client%20Dashboard/client_profile/client_profile_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Notifications/notification_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Notifications/notifiication_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Profile/profile_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Profile/profile_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/request_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Request/request_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Statistics/statastics_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Statistics/statistics_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subcription_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subcription_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subscription_form/subscription_form_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Subscription/subscription_form/subscription_form_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Upload/upload_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Upload/upload_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Vehicles/vehicle_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Vehicles/vehicle_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/View_vehicles/Vehicle_tabview/document_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/View_vehicles/Vehicle_tabview/document_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/View_vehicles/view_vehicle_biding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/View_vehicles/view_vehicle_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet/wallet_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet/wallet_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet_Recharge/recharge_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Wallet_Recharge/recharge_screen.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Welcome/welcome_binding.dart';
import 'package:mobility_planning_version4/Screens/Driver%20Dashboard/Welcome/welcome_screen.dart';
import 'package:mobility_planning_version4/Screens/Login/login_binding.dart';
import 'package:mobility_planning_version4/Screens/Login/login_screen.dart';
import 'package:mobility_planning_version4/Screens/Pushnotification/push_binding.dart';
import 'package:mobility_planning_version4/Screens/Pushnotification/push_not_screen.dart';
import 'package:mobility_planning_version4/Screens/SignUp/signup_binding.dart';
import 'package:mobility_planning_version4/Screens/SignUp/signup_screen.dart';
import 'package:mobility_planning_version4/Screens/Welcome/welcome_binding.dart';
import 'package:mobility_planning_version4/Screens/Welcome/welcome_screen.dart';

class AppPages {
  static final pages = [
GetPage(
        name: AppRoutes.welcome,
        page: () => const WelcomeScreen(),
        binding: WelcomeBinding()),
          GetPage(
        name: AppRoutes.signup,
        page: () => const SignUpPage(),
        binding: SignupBinding()),
           GetPage(
        name: AppRoutes.activation,
        page: () => const ActivationPage(),
        binding: ActivationBinding()),
         GetPage(
        name: AppRoutes.clientwelcome,
        page: () => const ClientHomePage(),
        binding: ClientWelcomeBinding()),
               GetPage(
        name: AppRoutes.login,
        page: () => const LoginPage(),
        binding: LoginBinding()),
         GetPage(
        name: AppRoutes.driverupload,
        page: () => const DriverUploadPage(),
        binding: DriverUploadBinding()),
            GetPage(
        name: AppRoutes.driverwelcome,
        page: () =>  DriverHomePage(),
        binding: DriverWelcomeBinding()),
            GetPage(
        name: AppRoutes.driverStats,
        page: () =>  DriverDashboardPage(),
        binding: DriverDashboardBinding()),
        
          GetPage(
        name: AppRoutes.driverprofile,
        page: () =>   DriverProfilePage(),
        binding: DriverProfileBinding()),
          GetPage(
        name: AppRoutes.viewvehicle,
        page: () => const ViewVehiclePage(),
        binding: ViewVehicleBinding()),
         GetPage(
        name: AppRoutes.drivervehicle,
        page: () => const DriverVehiclePage(),
        binding: DriverVehicleBinding()),
         GetPage(
        name: AppRoutes.driverrequest,
        
        page: () =>  DriverRequestPage(),
        binding: DriverRequestBinding()),
         GetPage(
        name: AppRoutes.driversubscription,
        page: () =>  const DriverSubscriptionPage(),
        binding: DriverSubscriptionBinding()),
            GetPage(
        name: AppRoutes.subscriptionform,
        page: () =>    SubscribeNowPage(),
        binding: SubscriptionFormBinding()),
         GetPage(
        name: AppRoutes.drivernotification,
        page: () =>     BookingNotificationsPage(),
        binding: NotifiicationBinding()),
   GetPage(
        name: AppRoutes.userwallet,
        page: () =>   UserWalletPage(),
        binding: UserWalletBinding()),
           GetPage(
        name: AppRoutes.driveruploadeddocuments,
        page: () =>    DriverDocumentsPage(),
        binding: DriverVehicleDocumentBinding()),
    
      GetPage(
        name: AppRoutes.clientprofile,
        page: () =>   ClientProfilePage(),
        binding: ClientProfileBinding()),

          GetPage(
        name: AppRoutes.ridedetails,
        page: () =>   RideDetailsPage("car", rideType: 'Car',),
        binding: RideDetailBinding()),

         GetPage(
        name: AppRoutes.reservationscreen,
        page: () =>   const ReservationScreen(),
        binding: RequestFormBinding()),
            GetPage(
        name: AppRoutes.walletrecharge,
        page: () =>   WalletRechargePage(),
        binding: WalletRechargeBinding()),
           GetPage(
        name: AppRoutes.bookinghistory,
        page: () =>   ClientBookingHistory(),
        binding: ClientBookingHistoryBinding()),


          GetPage(
        name: AppRoutes.waitingconfirmation,
        page: () =>    ReservationWaitingPage(),
        binding: WaitngBinding()),

    GetPage(
        name: AppRoutes.pushnotification,
        page: () =>   PushNotificationPage(),
        binding: PushBinding()),
           GetPage(
        name: AppRoutes.trackride,
        page: () =>    RideTrackingPage(),
        binding: RideTrackingBinding()),
          GetPage(
        name: AppRoutes.ticketsearch,
        page: () =>    BusTicketSearchPage(),
        binding: BusTicketSearchBinding()),
         GetPage(
        name: AppRoutes.departurelist,
        page: () =>    DepartureListPage(),
        binding: DepartureListBinding()),
 GetPage(
        name: AppRoutes.seatview,
        page: () =>    SeatViewPage(),
        binding: SeatViewBinding()),
        
  ];}