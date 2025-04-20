using MauiAppGestaoImoveis.Views;

namespace MauiAppGestaoImoveis
{
    public partial class AppShell : Shell
    {
        public AppShell()
        {
            InitializeComponent();
            
            //Registro das rotas
            Routing.RegisterRoute("login", typeof(LoginPage));
            Routing.RegisterRoute("main", typeof(MainPageApp));
            Routing.RegisterRoute("renters", typeof(RenterPage));
            Routing.RegisterRoute("monthly_bills", typeof(MonthlyBillsPage));
            Routing.RegisterRoute("newRenter", typeof(AddRenterPage));
            Routing.RegisterRoute("late_bills", typeof(LateBillsPage));
            Routing.RegisterRoute("payments", typeof(PaymentsPage));
            Routing.RegisterRoute("addBills", typeof(AddRenterBillsPage));

            //em caso de esquecimento, lembre-se de olhar a classe LoginPage, la tem 
            //a estrutura de como mandar para a proxima pagina

            //Iniciar o app pela LoginPage
            //GoToAsync("login");
        }
    }
}
